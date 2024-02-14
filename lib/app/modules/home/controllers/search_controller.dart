// import 'package:blood_donate_flutter_project/app/services/api_client.dart';
// import 'package:blood_donate_flutter_project/app/services/api_end_points.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../data/models/donor_history_list_model.dart';
// import '../../../data/models/search_user_model.dart';
//
// class SearchController extends GetxController {
//
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//   String selectedBloodGroup = ' ';
//   final inProgress = false.obs;
//
//   SearchUserModel? searchUser;
//   DonorHistoryList? donorHistoryList;
//
//   Future<bool> searchDonor(String bloodGroup, String division, String district,
//       String upzila, String postOffice) async {
//     inProgress.value = true;
//     update();
//
//     final response = await ApiClient().getRequest("${ApiEndPoints.getSearchDonor}"
//         "blood_group=$bloodGroup"
//         "&division_id=$division"
//         "&district_id=$district"
//         "&area_id=$upzila"
//         "&post_office=$postOffice");
//
//     inProgress.value = false;
//
//     if (response.isSuccess) {
//       searchUser = searchUserModelFromJson(response.jsonResponse!);
//       return true;
//     } else {
//
//       return false;
//     }
//   }
//
//   Future<bool> getDonationList() async {
//     inProgress.value = true;
//     update();
//     final response =
//     await ApiClient().getRequest(ApiEndPoints.getDonorList);
//     inProgress.value = false;
//     if (response.isSuccess) {
//       donorHistoryList = donorHistoryListFromJson(response.jsonResponse!);
//       update();
//       return true;
//     } else {
//       Get.showSnackbar(const GetSnackBar(
//         title: 'Search Donor Fail',
//         duration: Duration(seconds: 2),
//         isDismissible: true,
//         message: 'No donor found at this moment',
//       ));
//       return false;
//     }
//   }
// }
import 'package:blood_donate_flutter_project/app/services/api_client.dart';
import 'package:blood_donate_flutter_project/app/services/api_end_points.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/donor_history_list_model.dart';
import '../../../data/models/search_user_model.dart';

class SearchController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String selectedBloodGroup = ' ';
  final inProgress = false.obs;

  SearchUserModel? searchUser;
  DonorHistoryList? donorHistoryList;

  @override
  void onInit() {
    getDonationList(); // Fetch donation list when the controller is initialized
    super.onInit();
  }

  Future<bool> searchDonor(String bloodGroup, String division, String district, String upzila, String postOffice) async {
    inProgress.value = true;
    update();

    final response = await ApiClient().getRequest("${ApiEndPoints.getSearchDonor}"
        "blood_group=$bloodGroup"
        "&division_id=$division"
        "&district_id=$district"
        "&area_id=$upzila"
        "&post_office=$postOffice");

    inProgress.value = false;

    if (response.isSuccess) {
      searchUser = searchUserModelFromJson(response.jsonResponse!);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> getDonationList() async {
    inProgress.value = true;
    update();
    final response = await ApiClient().getRequest(ApiEndPoints.getDonorList);
    inProgress.value = false;
    if (response.isSuccess) {
      donorHistoryList = donorHistoryListFromJson(response.jsonResponse!);
      update();
      return true;
    } else {
      Get.showSnackbar(const GetSnackBar(
        title: 'Search Donor Fail',
        duration: Duration(seconds: 2),
        isDismissible: true,
        message: 'No donor found at this moment',
      ));
      return false;
    }
  }
}
