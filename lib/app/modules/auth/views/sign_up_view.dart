import 'package:blood_donate_flutter_project/app/modules/auth/controllers/auth_controller.dart';
import 'package:blood_donate_flutter_project/app/modules/auth/views/login_view.dart';
import 'package:blood_donate_flutter_project/app/modules/auth/views/widgets/password_text_field.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../data/models/request/registration_req.dart';
import 'widgets/location_form.dart';

class SignUpScreen extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Registration'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: w,
                          height: h * 0.3,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/bbbb.png'),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          width: w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Donate Blood, Save A Life",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.red.shade900,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Provide Your Information",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: controller.usernameTEController,
                          decoration: const InputDecoration(
                            labelText: 'User Name',
                          ),
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Enter your name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8.0),
                        LocationFormScreen(
                          selectedDivisionName:
                              controller.selectedDivision.value,
                          selectedDistrictName:
                              controller.selectedDistrict.value,
                          selectedUpzilaName: controller.selectedUpzila.value,
                          selectedUnionName: controller.selectedUnion.value,
                          selectedBloodGroup: controller.selectedBloodGroup,
                          onBloodGroupSelected: (v) {},
                          onSelectDivision: controller.onSelectedDivision(tag!),
                          onSelectedDistrict:
                              controller.onSelectedDistrict(tag!),
                          onSelectedUpzila: controller.onSelectedUpzila(tag!),
                          onSelectedUnion: controller.onSelectedUnion(tag!),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.emailTEController,
                          decoration: const InputDecoration(
                            labelText: "Email",
                          ),
                          validator: (String? value) {
                            bool isValidEmail = RegExp(
                                    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                .hasMatch(value!);

                            if (!isValidEmail) {
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 4.0),
                        TextFormField(
                          controller: controller.mobileNumberTEController,
                          decoration: const InputDecoration(
                            labelText: 'Mobile',
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (String? value) {
                            bool isValidPhoneNumber =
                                RegExp(r"^0[0-9]{10}$").hasMatch(value!);
                            if (!isValidPhoneNumber) {
                              return 'Enter a valid 11-digit mobile number starting with 0';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 4.0),
                        dobTextFormField(context),
                        const SizedBox(height: 4.0),
                        PasswordTextField(
                          passwordController: controller.passwordTEController,
                          obscureText: controller.obscureText.value,
                          onTapSuffix: () {
                            controller.obscureText.value =
                                !controller.obscureText.value;
                          },
                        ),
                        const SizedBox(height: 4.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text('Weight over 50 kg?'),
                                const Spacer(),
                                Checkbox(
                                  activeColor: Colors.red.shade800,
                                  checkColor: Colors.white,
                                  value:
                                      controller.weightOver50Controller.value,
                                  onChanged: (value) {
                                    controller.weightOver50Controller.value =
                                        value!;
                                  },
                                ),
                              ],
                            ),
                            if (!controller.weightOver50Controller.value)
                              const Text(
                                  'Please confirm that your weight is over 50 kg',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 12))
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Visibility(
                          visible: controller.isLoading.value == false,
                          replacement: const Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  final registrationParams = RegistrationReq(
                                    name: controller.usernameTEController.text,
                                    mobile: controller
                                        .mobileNumberTEController.text
                                        .trim(),
                                    email: controller.emailTEController.text
                                        .trim(),
                                    dob: controller.dobController.text,
                                    blood: controller.selectedBloodGroup,
                                    weight: controller.weightOver50Controller
                                        .toString(),
                                    password:
                                        controller.passwordTEController.text,
                                    address: Address(
                                      divisionId:
                                          controller.selectedDivision.value,
                                      districtId:
                                          controller.selectedDistrict.value,
                                      areaId: controller.selectedUpzila.value,
                                      postOffice:
                                          controller.selectedUnion.value,
                                    ),
                                  );
                                  if (controller.selectedBloodGroup == ' ') {
                                    // showSnackMessage(
                                    //     context, 'Select your blood group');
                                    return;
                                  }

                                  if (controller.selectedDivision == null ||
                                      controller.selectedDivision!.isEmpty) {
                                    // showSnackMessage(
                                    //     context, 'Select your division');
                                    return;
                                  }

                                  if (controller.selectedDistrict == null ||
                                      controller.selectedDistrict!.isEmpty) {
                                    // showSnackMessage(
                                    //     context, 'Select your district');
                                    return;
                                  }

                                  if (controller.selectedUpzila == null ||
                                      controller.selectedUpzila!.isEmpty) {
                                    // showSnackMessage(
                                    //     context, 'Select your upzila');
                                    return;
                                  }

                                  if (controller.selectedUnion == null ||
                                      controller.selectedUnion!.isEmpty) {
                                    // showSnackMessage(
                                    //     context, 'Select your union');
                                    return;
                                  }
                                  await controller
                                      .registration(registrationParams);
                                }
                              },
                              child: const Text('Submit'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Have an account?",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            TextButton(
                              onPressed: () {
                                Get.offAll(const LoginView());
                              },
                              child: const Text(
                                'Sign In',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ))),
      ),
    );
  }

  TextFormField dobTextFormField(BuildContext context) {
    return TextFormField(
      controller: controller.dobController,
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Date of Birth',
        suffixIcon: IconButton(
          onPressed: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1950),
              lastDate: DateTime(2050),
            );
            if (pickedDate != null &&
                pickedDate != controller.dobController.text) {
              controller.dobController.text =
                  "${pickedDate.toLocal()}".split(' ')[0];
            }
          },
          icon: const Icon(Icons.calendar_today, color: Colors.grey),
        ),
      ),
      keyboardType: TextInputType.datetime,
      validator: (String? value) {
        if (value?.trim().isEmpty ?? true) {
          return 'Enter your Date of Birth';
        }
        return null;
      },
    );
  }

  void _clearTextFields() {
    controller.usernameTEController.clear();
    controller.emailTEController.clear();
    controller.dobController.clear();
    controller.mobileNumberTEController.clear();
    controller.passwordTEController.clear();
  }
}
