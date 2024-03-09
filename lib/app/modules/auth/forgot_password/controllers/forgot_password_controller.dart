import 'package:blood_donate_flutter_project/app/modules/auth/forgot_password/views/pin_verification_view.dart';
import 'package:blood_donate_flutter_project/app/modules/auth/forgot_password/views/reset_password_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

class ForgotPasswordController extends GetxController {
  final forgotPassFormKey = GlobalKey<FormState>();
  final otpFormKey = GlobalKey<FormState>();
  final resetPassFormKey = GlobalKey<FormState>();

  final emailTextEditController = TextEditingController();
  final otpTextEditController = TextEditingController();
  final passwordTextEditController = TextEditingController();
  final confirmPasswordTextEditController = TextEditingController();

  final obscureText = true.obs;

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

  void sendOtp() {
    // validate form
    if (forgotPassFormKey.currentState!.validate()) {
      // send otp
      Get.off(() => PinVerificationView());
    }
  }

  void verifyOtp() {
    Get.off(() => ResetPasswordView());
  }

  void resetPassword() {
    Get.offAllNamed(Routes.LOGIN);
  }
}
