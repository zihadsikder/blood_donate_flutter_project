import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/widgets/password_text_field.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/forgot_password_controller.dart';

class ResetPasswordView extends StatelessWidget {
  ResetPasswordView({super.key, required this.mobile, required this.otp});

  final controller = Get.put(ForgotPasswordController());

  final String mobile;
  final String otp;

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
                    'Set Password',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Minimum password length should be more than 6 letters',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Form(
                    key: controller.resetPassFormKey,
                    child: Column(
                      children: [
                        PasswordTextField(
                          passwordController:
                              controller.passwordTextEditController,
                          obscureText: !controller.obscureText.value,
                          onTapSuffix: () {
                            controller.obscureText.value =
                                !controller.obscureText.value;
                          },
                          suffixIcon: Icon(
                            controller.obscureText.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color:
                                Colors.grey, // Customize the icon color as needed
                          ),
                        ),
                      ],
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
                        onPressed: () => controller.resetPassword(mobile, otp),
                        child: const Text('Confirm'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Have an account?",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.LOGIN);
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
