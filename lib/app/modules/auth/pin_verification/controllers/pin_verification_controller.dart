import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/user_model.dart';
import '../../../../data/repositories/auth_repository.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/auth_cache.dart';
import '../../forgot_password/views/reset_password_view.dart';

class PinVerificationController extends GetxController {
  final isLoading = false.obs;

  final formKey = GlobalKey<FormState>();
  final otpTextEditController = TextEditingController();

  String? mobileNumber;

  String? fromScreen;

  final remainingTime = '5:00'.obs;

  late Timer timer;

  final obscureText = false.obs;

  @override
  void onInit() {
    if (Get.arguments != null) {
      fromScreen = Get.arguments['from_screen'];
      mobileNumber = Get.arguments['mobile_number'];
    }

    startTimer();
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

  Future<void> otpVerify() async {
    if (formKey.currentState!.validate() && mobileNumber != null) {
      isLoading.value = true;

      final otp = otpTextEditController.text.trim();

      if (fromScreen == Routes.FORGOT_PASSWORD) {
        final response =
            await AuthRepository.forgetPassOtpVerify(mobileNumber!, otp);
        isLoading.value = false;

        if (response.isSuccess) {
          Get.off(() => ResetPasswordView(mobile: mobileNumber!, otp: otp));
        }

      } else {
        final response = await AuthRepository.verifyOtp(mobileNumber!, otp);
        isLoading.value = false;

        if (response.isSuccess) {
          LoginRes loginRes = loginResFromJson(response.jsonResponse!);

          AuthCache.to.saveUserInformation(
            loginRes.data?.accessToken ?? '',
            loginRes,
          );
          Get.offNamed(Routes.BOTTOM_NAV);
        }
      }
    }
  }

  void resendOtp() async {
    isLoading.value = true;

    if (mobileNumber != null) {
      final response = await AuthRepository.resendOtp(
          mobileNumber!); // Pass the mobile number
      isLoading.value = false;

      if (response.isSuccess) {
        Get.snackbar('Message', response.message ?? 'Something Error!');
        startTimer();
        Get.offNamed(Routes.PIN_VERIFICATION);
      }
    }
  }
}
