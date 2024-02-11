import 'package:blood_donate_flutter_project/app/services/api_client.dart';
import 'package:blood_donate_flutter_project/app/services/api_end_points.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/search_user_model.dart';

class SearchController extends GetxController {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String selectedBloodGroup = ' ';


  MSearchUserModel? user;
  final inProgress = false.obs;



  Future<bool> searchDonor(String bloodGroup, String division, String district,
      String upzila, String postOffice) async {
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
      user = mSearchUserModelFromJson(response.jsonResponse!);
      return true;
    } else {

      return false;
    }
  }
}
