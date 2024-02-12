import 'package:blood_donate_flutter_project/app/data/models/request/registration_req.dart';
import 'package:blood_donate_flutter_project/app/data/repositories/auth_repository.dart';
import 'package:blood_donate_flutter_project/app/services/api_client.dart';
import 'package:blood_donate_flutter_project/app/services/api_end_points.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/network_response.dart';
import '../../../../data/models/user_model.dart';
import '../../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController passwordTEController = TextEditingController();
  final TextEditingController numberTEController = TextEditingController();

  final obscureText = true.obs;

  final isLoading = false.obs;

  Future<void> registration(RegistrationReq params) async {
    isLoading.value = true;
    NetworkResponse response = await AuthRepository.registration(params);
    if (response.isSuccess) {
      //successful snackber
    } else {
      //error snackber
    }
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> login(String mobile, String password) async {
    isLoading.value = true;

    final NetworkResponse response = await ApiClient().postRequest(
      ApiEndPoints.login,
      body: {"mobile": mobile, "password": password},
    );
    isLoading.value = false;

    if (response.isSuccess && response.jsonResponse != null) {
      UserModel user = userModelFromJson(response.jsonResponse!);

      //show snackbar
      const GetSnackBar(
        message: 'Login Successfully',
      );

      return true;
    } else {
      const GetSnackBar(
        message: 'Login failed. Try again',
      );

      return false;
    }
  }

  onPressHome() {
    Get.toNamed(Routes.HOME);
  }
}
