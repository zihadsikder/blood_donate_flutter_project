import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/network_response.dart';
import '../../../../data/models/profile_data_res.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/api_client.dart';
import '../../../../services/api_end_points.dart';
import '../../../../services/auth_cache.dart';

class AccountsController extends GetxController {
  final TextEditingController placeTEController = TextEditingController();
  final TextEditingController dateTEController = TextEditingController();
  final TextEditingController usernameTEController = TextEditingController();
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController mobileTEController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AuthCache get authCache => Get.find<AuthCache>();

  final inProgress = false.obs;

  final isProfileActive = true.obs;

   ProfileData? profileData ;

  @override
  void onInit() {
    getProfileData();
    super.onInit();
  }

  Future<bool> getProfileData() async {
    inProgress.value = true;

    final NetworkResponse response =
    await ApiClient().getRequest(ApiEndPoints.getProfileData);
    inProgress.value = false;
    if (response.isSuccess) {
      profileData = profileDataFromJson(response.jsonResponse!);
      return true;
    }
    return false;
  }

  Future<bool> toggleProfileActivation(bool isActive) async {
    inProgress.value = true;
    try {
      final response = await ApiClient()
          .putRequest(ApiEndPoints.profileActive, body: {"isActive": isActive});
      if (response.isSuccess) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  void logout() async {
    inProgress.value = true;

    Get.back(closeOverlays: true);

    // show overlay loader
    Get.dialog(
      const SizedBox(
        height: 16,
        width: 16,
        child: Center(child: CircularProgressIndicator()),
      ),
      barrierDismissible: false,
    );

    final response =
        await ApiClient().postRequest(ApiEndPoints.logout, body: {});
    inProgress.value = false;
    if (response.isSuccess) {
      Get.back();
      authCache.clearAuthData();
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
