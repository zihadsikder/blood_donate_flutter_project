import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/forgot_password_controller.dart';

class PinVerificationView extends StatelessWidget {
  PinVerificationView({super.key, required this.mobile});

  final controller = Get.put(ForgotPasswordController());

  final String mobile;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Obx(
              () => Column(
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
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w600),
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
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Please put your OTP';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Visibility(
                      visible: controller.isLoading.value == false,
                      replacement: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          controller.forgetPassOtpVerify(mobile);
                        },
                        child: const Text('Verify'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),

                  //if (controller.remainingTime.value > 0)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                          children: [
                            const TextSpan(
                              text: 'This code will expire in:',
                              style: TextStyle(overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            // Use a TextSpan here to hold the countdown time
                            TextSpan(
                              text: controller.remainingTime.value,
                              style: TextStyle(
                                color:
                                    controller.remainingTime.value.contains(':')
                                        ? Colors.grey.shade800
                                        : Colors.red.shade800,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                        ),
                        onPressed: () => controller.resendOtp(mobile),
                        child: Visibility(
                          visible:
                              controller.remainingTime.value == 'Time\'s Up' ,
                          child: Text(
                            'Resend Code',
                            style: TextStyle(color: Colors.grey.shade800),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 4.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Have an account?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Colors.transparent),
                        ),
                        onPressed: () {
                          Get.offNamed(Routes.LOGIN);
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
