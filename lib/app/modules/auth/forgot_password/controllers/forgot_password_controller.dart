import 'dart:async';

import 'package:blood_bd/app/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

class ForgotPasswordController extends GetxController {
  final isLoading = false.obs;

  final forgotPassFormKey = GlobalKey<FormState>();
  final resetPassFormKey = GlobalKey<FormState>();

  final numberTextEditController = TextEditingController();

  final passwordTextEditController = TextEditingController();
  final confirmPasswordTextEditController = TextEditingController();

  final obscureText = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> sendOtpForgetPass() async {
    if (forgotPassFormKey.currentState!.validate()) {
      isLoading.value = true;

      final mobile = numberTextEditController.text;

      final response = await AuthRepository.sendOtpForgetPass(mobile);
      isLoading.value = false;

      if (response.isSuccess) {
        Get.snackbar('Message', response.message ?? 'Something Error!');

        //Get.offNamed(Routes.PIN_VERIFICATION);
        Get.offNamed(Routes.PIN_VERIFICATION, arguments: {
          'from_screen': Routes.PIN_VERIFICATION,
          'mobile_number': mobile,
        });

      }
    }
  }

  void resetPassword(mobile, otp) async {
    if (resetPassFormKey.currentState!.validate()) {
      isLoading.value = true;

      final String password = passwordTextEditController.text.trim();

      final response =
          await AuthRepository.resetPassword(mobile, otp, password);
      isLoading.value = false;

      if (response.isSuccess) {
        Get.offAllNamed(Routes.LOGIN);

        Get.snackbar('Message', response.message ?? 'Something Error!');
      }
    }
  }
}
