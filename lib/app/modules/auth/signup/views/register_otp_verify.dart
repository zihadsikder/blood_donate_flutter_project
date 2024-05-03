import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/otp_screen.dart';
import '../controllers/signup_controller.dart';

class RegisterPinVerification extends StatelessWidget {
  RegisterPinVerification({super.key, required this.mobile});

  final controller = Get.put(SignupController());
  final String mobile;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => OtpScreen(
        formKey: controller.otpFormKey,
        textController: controller.otpTextEditController,
        verifyVisible: controller.isLoading.value == false,
        verifyOnPressed: () => controller.verifyOtp(mobile),
        downTime: controller.remainingTime.value,
        downTimeColor: controller.remainingTime.value.contains(':')
            ? Colors.grey.shade800
            : Colors.red.shade800,
        resendOnPressed: () => controller.resendOtp(mobile),
        resendVisible: controller.remainingTime.value == 'Time\'s Up',
      ),
    );
  }
}