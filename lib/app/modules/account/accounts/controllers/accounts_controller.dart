import 'package:blood_donate_flutter_project/app/routes/app_pages.dart';
import 'package:blood_donate_flutter_project/app/services/api_client.dart';
import 'package:blood_donate_flutter_project/app/services/api_end_points.dart';
import 'package:blood_donate_flutter_project/app/services/auth_cache.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  Future<bool> logout() async {
    inProgress.value = true;
    final response =
        await ApiClient().postRequest(ApiEndPoints.logout, body: {});
    inProgress.value = false;
    if (response.isSuccess) {
      Get.back();
      Get.snackbar('Success', 'Successfully Logout');
      authCache.clearAuthData();
      Get.offAllNamed(Routes.LOGIN);
      return true;
    } else {
      Get.snackbar('Error', 'Something wrong');
    }
    return false;
  }
}
