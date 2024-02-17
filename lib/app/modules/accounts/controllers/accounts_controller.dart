import 'package:blood_donate_flutter_project/app/routes/app_pages.dart';
import 'package:blood_donate_flutter_project/app/services/api_client.dart';
import 'package:blood_donate_flutter_project/app/services/api_end_points.dart';
import 'package:blood_donate_flutter_project/app/services/auth_cache.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/donor_history_list_model.dart';
import '../../../data/models/network_response.dart';

class AccountsController extends GetxController {

  final TextEditingController placeTEController = TextEditingController();
  final TextEditingController dateTEController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AuthCache get authCache => Get.find<AuthCache>();

  final inProgress = false.obs;

  final isProfileActive = false.obs;

  String failMessage = '';

  String get failureMessage => failMessage;
  DonorHistoryList? donorHistoryList;

  Future<bool> addDonation() async {
    if (formKey.currentState!.validate()) {
      inProgress.value = true;


      final response = await ApiClient().postRequest(
        ApiEndPoints.storeDonationHistory,
        body: {
          "donation_place": placeTEController.text.trim(),
          "donation_date": dateTEController.text.trim(),
        },
      );
      inProgress.value = false;
      if (response.isSuccess) {
        placeTEController.text.trim();
        dateTEController.text.trim();
        failMessage = ('New History added!');
        return true;
      } else {
        failMessage = 'Add Donation Fail!';
        return false;
      }

    }
    return false;
  }

  Future<bool> getDonationList() async {
    inProgress.value = true;

    final NetworkResponse response =
    await ApiClient().getRequest(ApiEndPoints.getDonorList);
    inProgress.value = false;
    if (response.isSuccess) {
      donorHistoryList = donorHistoryListFromJson(response.jsonResponse!);

      return true;
    } else {

      return false;
    }
  }

  Future<void> deleteDonation({required String id}) async {
    if (formKey.currentState!.validate()) {
      inProgress.value = true;
      final response =
      await ApiClient().delRequest(ApiEndPoints.deleteDonation+id);
      inProgress.value = false;
      if (response.isSuccess) {
        failMessage = ('Delete Successful');
      } else {
        const GetSnackBar(
          message: 'Something Error',
          duration: Duration(seconds: 1),
        );
      }
    }
  }

  Future<bool> toggleProfileActivation(bool isActive) async {
    if (formKey.currentState!.validate()) {
      inProgress.value = true;
      try {
        final response = await ApiClient().putRequest(
            ApiEndPoints.profileActive, body:{
          "isActive": isActive
        } );
        if (response.isSuccess) {
          return true;
        } else {
          return false;
        }
      } catch (e) {
        return false;
      }
    }
    return false;
  }

  Future<bool> logout() async {
    if (formKey.currentState!.validate()) {
      inProgress.value = true;
      final response =
      await ApiClient().postRequest(ApiEndPoints.logout, body: {});
      inProgress.value = false;
      if (response.isSuccess) {
        authCache.clearAuthData();
        Get.offAllNamed(Routes.LOGIN);
        return true;
      } else {
        const GetSnackBar(
          message: 'Something Error',
          duration: Duration(seconds: 1),
        );
      }
    }
    return false;
  }



}
