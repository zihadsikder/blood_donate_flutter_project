import 'package:blood_donate_flutter_project/app/services/api_client.dart';
import 'package:blood_donate_flutter_project/app/services/api_end_points.dart';
import 'package:blood_donate_flutter_project/app/services/auth_cache.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/donor_history_list_model.dart';
import '../../../data/models/network_response.dart';

class AccountsController extends GetxController {
  DonorHistoryList _donorHistoryList = DonorHistoryList();

  DonorHistoryList get donorHistoryList => _donorHistoryList;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final inProgress = false.obs;

  AuthCache get authCache => Get.find<AuthCache>();

  String failMessage = '';

  String get failureMessage => failMessage;

  Future<bool> getDonationList() async {
    inProgress.value = true;

    final NetworkResponse response = await ApiClient().getRequest(ApiEndPoints.getDonorList);
    inProgress.value = false;
    if (response.isSuccess) {
      _donorHistoryList = donorHistoryListFromJson(response.jsonResponse!);
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
