import 'package:blood_donate_flutter_project/app/services/api_client.dart';
import 'package:blood_donate_flutter_project/app/services/api_end_points.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/search_user_model.dart';


class SearchDonationController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String selectedBloodGroup = ' ';
  final inProgress = false.obs;

  SearchUserModel? searchUser;

  Future<void> searchDonor(String bloodGroup, String division,
      String district, String upzila, String postOffice) async {
    if (formKey.currentState!.validate()) {
      inProgress.value = true;

      final response = await ApiClient().getRequest(
          "${ApiEndPoints.getSearchDonor}"
              "blood_group=$bloodGroup"
              "&division=$division"
              "&district=$district"
              "&area=$upzila"
              "&post_office=$postOffice");

      inProgress.value = false;

      if (response.isSuccess) {
        searchUser = searchUserModelFromJson(response.jsonResponse!);
        inProgress.value = true;
      }else{
        Get.showSnackbar(const GetSnackBar(
          title: 'Search Donor Fail',
          duration: Duration(seconds: 2),
          isDismissible: true,
          message: 'No donor found at this moment',),);
        inProgress.value = false;
      }
    }
  }
}
