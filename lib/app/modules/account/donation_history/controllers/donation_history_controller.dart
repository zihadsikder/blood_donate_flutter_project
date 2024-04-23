import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/donor_history_list_model.dart';
import '../../../../data/models/network_response.dart';
import '../../../../services/api_client.dart';
import '../../../../services/api_end_points.dart';

class DonationHistoryController extends GetxController {

  final TextEditingController placeTEController = TextEditingController();
  final TextEditingController dateTEController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final inProgress = false.obs;

  DonorHistoryList? donorHistoryList;

  @override
  void onInit() {
    getDonationList();
    super.onInit();
  }

  Future<void> addDonation({
    required String donationPlace,
    required String donationDate,
  }) async {
    if (formKey.currentState!.validate()) {
      inProgress.value = true;

      final response = await ApiClient().postRequest(
        ApiEndPoints.storeDonationHistory,
        body: {
          "donation_place": placeTEController.text.trim(),
          "donation_date": dateTEController.text,
        },
      );
      inProgress.value = false;
      if (response.isSuccess) {
        placeTEController.text.trim();
        dateTEController.text.trim();
        clearTextFields();
        inProgress.value = true;
        await getDonationList();
        Get.snackbar('Success', 'Add Donation Successful');
      } else {
        inProgress.value = false;
      }
    }
  }

  Future<bool> getDonationList() async {
    inProgress.value = true;

    final NetworkResponse response =
    await ApiClient().getRequest(ApiEndPoints.getDonorList);
    inProgress.value = false;
    if (response.isSuccess) {
      donorHistoryList = donorHistoryListFromJson(response.jsonResponse!);
      return true;
    }
    return false;
  }

  Future<bool> deleteDonation({required String id}) async {
    inProgress.value = true;

    Get.back();

    final response =
    await ApiClient().delRequest(ApiEndPoints.deleteDonation + id);
    inProgress.value = false;
    if (response.isSuccess) {
      donorHistoryList!.data!.removeWhere((element) => element.id == id);

      Get.snackbar('Success', 'Delete Successful');
      return true;
    } else {
      return false;
    }
  }
  void clearTextFields() {
    placeTEController.clear();
    dateTEController.clear();
  }

}
