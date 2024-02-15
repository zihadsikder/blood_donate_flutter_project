import 'package:blood_donate_flutter_project/app/routes/app_pages.dart';
import 'package:blood_donate_flutter_project/app/services/api_client.dart';
import 'package:blood_donate_flutter_project/app/services/api_end_points.dart';
import 'package:blood_donate_flutter_project/app/services/auth_cache.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/donor_history_list_model.dart';
import '../../../data/models/network_response.dart';

class AccountsController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final inProgress = false.obs;

  AuthCache get authCache => Get.find<AuthCache>();

  String failMessage = '';

  String get failureMessage => failMessage;
  DonorHistoryList? donorHistoryList;

  Future<bool> getDonationList() async {
    inProgress.value = true;

    final NetworkResponse response =
        await ApiClient().getRequest(ApiEndPoints.getDonorList);
    inProgress.value = false;
    if (response.isSuccess) {
      donorHistoryList = donorHistoryListFromJson(response.jsonResponse!);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  Future<bool> addDonation(String place, String date) async {
    inProgress.value = true;

    final response = await ApiClient().postRequest(
      ApiEndPoints.storeDonationHistory,
      body: {
        "donation_place": place,
        "donation_date": date,
      },
    );
    inProgress.value = false;
    if (response.isSuccess) {
      place;
      date;

      failMessage = ('New History added!');
      return true;
    } else {
      failMessage = 'Add Donation Fail!';
      return false;
    }
  }

  Future<void> logout() async {
    if (formKey.currentState!.validate()) {
      inProgress.value = true;
      final response =
          await ApiClient().postRequest(ApiEndPoints.logout, body: {});
      inProgress.value = false;
      if (response.isSuccess) {
        authCache.clearAuthData();
        Get.offAllNamed(Routes.LOGIN);
        inProgress.value = true;
      } else {
        const GetSnackBar(
          message: 'Something Error',
          duration: Duration(seconds: 1),
        );
        inProgress.value = false;
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
