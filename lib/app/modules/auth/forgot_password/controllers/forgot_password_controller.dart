import 'dart:async';

import 'package:blood_bd/app/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../views/pin_verification_view.dart';
import '../views/reset_password_view.dart';

class ForgotPasswordController extends GetxController {
  final isLoading = false.obs;

  final forgotPassFormKey = GlobalKey<FormState>();
  final otpFormKey = GlobalKey<FormState>();
  final resetPassFormKey = GlobalKey<FormState>();

  final numberTextEditController = TextEditingController();
  final otpTextEditController = TextEditingController();
  final passwordTextEditController = TextEditingController();
  final confirmPasswordTextEditController = TextEditingController();

  final obscureText = true.obs;

  final remainingTime = 300.obs; // Initial time is 300 seconds

  // Countdown timer
  late Timer timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      remainingTime.value--;
      if (remainingTime.value <= 0) {
        timer.cancel(); // Stop the timer when time's up
        // You can add logic here for what to do when time's up
      }
    });
  }

  @override
  void onClose() {
    timer.cancel(); // Cancel the timer when the controller is closed
    // super.onClose();
  }

  Future<void> sendOtpForgetPass() async {
    if (forgotPassFormKey.currentState!.validate()) {
      isLoading.value = true;

      final mobile = numberTextEditController.text;

      final response = await AuthRepository.sendOtpForgetPass(mobile);
      isLoading.value = false;

      if (response.isSuccess) {
        Get.off(
          () => PinVerificationView(mobile: mobile),
        );
        Get.snackbar('Message', response.message ?? 'Something Error!');
        remainingTime.value = 300; // Reset time to 300 seconds
        startTimer();
      }
    }
  }

  Future<void> forgetPassOtpVerify(mobile) async {
    if (otpFormKey.currentState!.validate()) {
      isLoading.value = true;

      final otp = otpTextEditController.text.trim();

      final response = await AuthRepository.forgetPassOtpVerify(mobile, otp);

      isLoading.value = false;

      if (response.isSuccess) {
        Get.off(() => ResetPasswordView(mobile: mobile, otp: otp));

        remainingTime.value = 300; // Reset time to 300 seconds
        startTimer();
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

        // Start the countdown timer after sending OTP
        remainingTime.value = 300; // Reset time to 300 seconds
        startTimer();
      }
    }
  }

  void resendOtp(mobile) async {
    isLoading.value = true;

    final response =
        await AuthRepository.resendOtp(mobile); // Pass the mobile number
    isLoading.value = false;

    if (response.isSuccess) {
      Get.off(
        () => PinVerificationView(
          mobile: mobile,
        ),
      );
      Get.snackbar('Message', response.message ?? 'Something Error!');

      remainingTime.value = 300; // Reset time to 300 seconds
      startTimer();
    }
  }
}
