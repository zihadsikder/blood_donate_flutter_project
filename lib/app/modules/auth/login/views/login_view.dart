import 'package:blood_bd/app/core/constants/app_text_style.dart';
import 'package:blood_bd/app/modules/setting/views/setting_screens/privacy_screen.dart';
import 'package:blood_bd/app/modules/setting/views/setting_screens/support.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/widgets/password_text_field.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: AppColors.appGradient),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome",
                        style: TextStyle(color: AppColors.secondaryColor, fontSize: 36),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "A Smart & Easy Blood Donation System",
                        style: TextStyle(color: AppColors.secondaryColor, fontSize: 10),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Image.asset(
                      AppAssets.loginLogo1,
                      width: 150,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              flex: 8,
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: controller.formKey,
                      child: Obx(
                        () => Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColors.secondaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromRGBO(225, 95, 27, .3),
                                        blurRadius: 20,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: controller.numberTEController,
                                      decoration: const InputDecoration(
                                          hintText: "Mobile",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                      validator: (String? value) {
                                        bool isValidPhoneNumber =
                                            RegExp(r"^0[0-9]{10}$")
                                                .hasMatch(value!);
                                        if (!isValidPhoneNumber) {
                                          return 'Enter a valid 11-digit mobile number';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  //SizedBox(height: 20),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: PasswordTextField(
                                      passwordController:
                                          controller.passwordTEController,
                                      obscureText:
                                          !controller.obscureText.value,
                                      onTapSuffix: () {
                                        controller.obscureText.value =
                                            !controller.obscureText.value;
                                      },
                                      suffixIcon: Icon(
                                        controller.obscureText.value
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors
                                            .grey, // Customize the icon color as needed
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            InkWell(
                              onTap: () => controller.login(),
                              child: Container(
                                height: 50,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: AppColors.buttonColor),
                                child: Visibility(
                                  visible: controller.isLoading.value == false,
                                  replacement: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Sign In",
                                      style: AppTextStyles.textStyle()
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.FORGOT_PASSWORD);
                              },
                              child: const Text(
                                "Forgot Password!",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have account?",
                                  style: TextStyle(color: Colors.grey.shade500),
                                ),
                                TextButton(
                                  child:  Text(
                                    'Sign Up',
                                    style: AppTextStyles.textStyle(color: AppColors.buttonColor),),
                                  onPressed: () {
                                    Get.toNamed(Routes.SIGNUP);
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'By proceeding I accept the BLOOD APP',
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.to(() => const PrivacyScreen());
                            },
                            child: Text(
                              'PRIVACY       ||',
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(() => const Support());
                            },
                            child: Text(
                              'SUPPORT',
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
