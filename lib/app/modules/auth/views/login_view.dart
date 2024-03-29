import 'package:blood_donate_flutter_project/app/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import 'forget_password.dart';
import 'sign_up_view.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.red.shade900,
              Colors.red.shade800,
              Colors.red.shade500,
            ])),
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
                        style: TextStyle(color: Colors.white, fontSize: 36),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "A Smart Blood Donation System",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ],
                  ),
                  Image.asset(
                   AppAssets.loginLogo,
                    width: 150,
                    height: 80,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromRGBO(225, 95, 27, .3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10))
                                ]),
                            child: textField,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 50,
                            margin:
                            const EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.red.shade800),
                            child: Visibility(
                              visible:
                              controller.isLoading == false,
                              replacement: const Center(
                                  child: CircularProgressIndicator()),
                              child: const Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ),),

                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) =>
                                  const ForgotPassword());
                            },
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have account?",
                                style: TextStyle(color: Colors.grey.shade500),
                              ),
                              TextButton(
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 20),
                                ),
                                onPressed: () {
                                  Get.to(() =>  SignUpScreen());
                                },
                              )
                            ],
                          ),
                          const Text(
                            "Continue with social media",
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    // Your onTap action here
                                    // For example, you can open Facebook when tapped
                                    launchFacebook();
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.red.shade800,
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.facebook,
                                          // You can change this to the desired Facebook icon
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 8),
                                        // Adjust the spacing between icon and text
                                        Text(
                                          "Facebook",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    // Your onTap action here
                                    // For example, you can open Facebook when tapped
                                    launchGoogle();
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.red.shade800),
                                    child: const Center(
                                      child: Text(
                                        "Google",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
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
            )
          ],
        ),
      ),
    );
  }

  Column get textField {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: controller.numberTEController,
            decoration: const InputDecoration(
                hintText: "Mobile",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter Your Number';
              }
              return null;
            },
          ),
        ),
        //SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
          child: TextFormField(
            controller: controller.passwordTEController,
            obscureText: controller.obscureText.value,
            // Use a boolean variable to toggle password visibility
            decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none,
                suffixIcon: IconButton(
                  onPressed: () {

                     controller. obscureText.value =
                      !controller.obscureText.value; // Toggle the password visibility

                  },
                  icon: Icon(
                    controller. obscureText.value ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey, // Customize the icon color as needed
                  ),
                )),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter Correct Password';
              }
              return null;
            },
            keyboardType: TextInputType.visiblePassword,
          ),
        ),
      ],
    );
  }


  void launchFacebook() {}

  void launchGoogle() {}
}
