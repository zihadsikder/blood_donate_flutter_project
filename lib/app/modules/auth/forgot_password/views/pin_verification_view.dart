import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/forgot_password_controller.dart';

class PinVerificationView extends StatelessWidget {
  PinVerificationView({super.key});

  final controller = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Center(
                  child: Image.asset(
                    AppAssets.logo,
                    width: 120,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Pin Verification',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'A 6 digit OTP will be sent to your mobile number',
                  style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 18,
                ),
                Form(
                  key: controller.otpFormKey,
                  child: PinCodeTextField(
                    controller: controller.otpTextEditController,
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      activeColor: Colors.green,
                      selectedFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    onCompleted: (v) {},
                    onChanged: (value) {},
                    beforeTextPaste: (text) {
                      return true;
                    },
                    appContext: context,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.verifyOtp,
                    child: const Text('Verify'),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Have an account?",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black54),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offNamed(Routes.LOGIN);
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
