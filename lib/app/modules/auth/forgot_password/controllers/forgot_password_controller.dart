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

  final obscureText = false.obs;

  final remainingTime = '5:00'.obs; // Initial time is 300 seconds

  // Countdown timer
  late Timer timer;

  @override
  void onInit() {
    super.onInit();
  }

  void startTimer() {
    int totalTimeInSeconds = 300; // 5 minutes
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      totalTimeInSeconds--;
      if (totalTimeInSeconds <= 0) {
        timer.cancel(); // Stop the timer when time's up
        remainingTime.value = 'Time\'s Up'; // Set time's up message
        return;
      }
      int minutes = totalTimeInSeconds ~/ 60;
      int seconds = totalTimeInSeconds % 60;
      remainingTime.value = '$minutes:${seconds.toString().padLeft(2, '0')}';
    });
  }

  void cancelTimer() {
    timer.cancel(); // Cancel the timer
  }

  @override
  void onClose() {
    timer.cancel(); // Cancel the timer when the controller is closed
    super.onClose();
  }

  Future<void> sendOtpForgetPass() async {
    remainingTime.value = '5:00'; // Reset time to 300 seconds

    if (forgotPassFormKey.currentState!.validate()) {
      isLoading.value = true;

      final mobile = numberTextEditController.text;

      final response = await AuthRepository.sendOtpForgetPass(mobile);
      isLoading.value = false;

      if (response.isSuccess) {
        Get.snackbar('Message', response.message ?? 'Something Error!');

        startTimer();
        Get.off(
          () => PinVerificationView(mobile: mobile),
        );
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
        cancelTimer(); // Cancel the timer
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

  void resendOtp(mobile) async {
    remainingTime.value = '5:00'; // Reset time to 300 seconds

    isLoading.value = true;

    final response =
        await AuthRepository.resendOtp(mobile); // Pass the mobile number
    isLoading.value = false;

    if (response.isSuccess) {
      Get.snackbar('Message', response.message ?? 'Something Error!');

      startTimer();
      Get.off(
        () => PinVerificationView(
          mobile: mobile,
        ),
      );
    }
  }
}
