import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_assets.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Obx(
              ()=> Column(
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
                    'Your Mobile Number',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text('A 6 digit OTP will be sent to your mobile number',
                      style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(
                    height: 18,
                  ),
                  Form(
                    key: controller.forgotPassFormKey,
                    child: TextFormField(
                      controller: controller.numberTextEditController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Number',
                      ),
                      validator: (String? value) {
                        bool isValidPhoneNumber =
                        RegExp(r"^0[0-9]{10}$").hasMatch(value!);
                        if (!isValidPhoneNumber) {
                          return 'Enter a valid 11-digit mobile number';
                        }
                        return null;
                      },
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
                        child: CircularProgressIndicator(
                        ),),
                      child: ElevatedButton(
                        onPressed: controller.sendOtpForgetPass,
                        child: const Icon(Icons.arrow_circle_right_outlined),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Have an account?",
                          style: Theme.of(context).textTheme.bodySmall),
                      TextButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.transparent),
                        ),
                        onPressed: () {
                          Get.back();
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
      ),
    );
  }
}
