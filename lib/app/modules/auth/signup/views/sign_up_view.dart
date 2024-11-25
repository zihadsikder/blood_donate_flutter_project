import 'package:blood_bd/app/core/config/app_colors.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/widgets/dob_text_field.dart';
import '../../../../data/models/request/registration_req.dart';
import '../../login/views/widgets/area_dropdown.dart';
import '../../login/views/widgets/location_form.dart';
import '../../../../core/widgets/password_text_field.dart';
import '../controllers/signup_controller.dart';

class SignUpView extends GetView<SignupController> {
  const SignUpView({super.key});

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
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Form(
              key: controller.formKey,
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: w,
                      height: h * 0.3,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppAssets.signIn),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Donate Blood, Save A Life",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.buttonColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Provide Your Information",
                            style: TextStyle(
                              fontSize: 16,
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
                        labelText: 'Full Name',
                      ),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter your full name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8.0),
                    BloodGroupDropdown(
                      labelText: 'Select Blood Group',
                      onSelectBloodGroup: (String? val) {
                        controller.onSelectedBloodGroup(val);
                      },
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter your blood group';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8.0),
                    AreaDropDown(
                      label: 'select division',
                      onChanged: (String? val) {
                        controller.onSelectedDivision(val);
                      },
                      items: controller.divisionList,
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Please Select Division';
                        }
                        return null;
                      },
                    ),
                    AreaDropDown(
                      label: 'select district',
                      onChanged: (String? val) {
                        controller.onSelectedDistrict(val);
                      },
                      items: controller.districtList,
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Please Select District';
                        }
                        return null;
                      },
                    ),
                    AreaDropDown(
                      label: 'select area',
                      onChanged: (String? val) {
                        controller.onSelectedUpzila(val);
                      },
                      items: controller.upzilaList,
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Please Select Area';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: controller.postOfficeTEController,
                      decoration: const InputDecoration(
                        labelText: 'Address',
                      ),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter your address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.emailTEController,
                      decoration: const InputDecoration(
                        labelText: "Email(Mandatory)",
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
                    const SizedBox(height: 8.0),
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
                          return 'Enter a valid 11-digit mobile number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8.0),
                    DobTextField(
                      dbirthController: controller.dobController,
                      labelText: 'Date of Birth',
                      onTapSuffix: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2050),
                        );
                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          controller.dobController.text = formattedDate;
                        }
                      },
                    ),
                    const SizedBox(height: 8.0),
                    PasswordTextField(
                      passwordController: controller.passwordTEController,
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
                    const SizedBox(height: 8.0),
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
                              value: controller.isWeightOk.value,
                              onChanged: (value) {
                                controller.isWeightOk.value = value!;
                              },
                            ),
                          ],
                        ),
                        if (!controller.isWeightOk.value)
                          const Text(
                              'Please confirm that your weight is over 50 kg',
                              style: TextStyle(color: Colors.red, fontSize: 12))
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
                            if (controller.formKey.currentState!.validate()) {
                              final registrationParams = RegistrationReq(
                                name: controller.usernameTEController.text,
                                mobile: controller.mobileNumberTEController.text
                                    .trim(),
                                email: controller.emailTEController.text.trim(),
                                dob: controller.dobController.text,
                                blood: controller.selectedBloodGroup.value,
                                weight: controller.isWeightOk.toString(),
                                password: controller.passwordTEController.text,
                                address: Address(
                                  divisionId: controller.selectedDivision.value,
                                  districtId: controller.selectedDistrict.value,
                                  areaId: controller.selectedUpzila.value,
                                  postOffice: controller
                                      .postOfficeTEController.text
                                      .trim(),
                                ),
                              );
                              await controller.registration(registrationParams);
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
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Colors.transparent),
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
