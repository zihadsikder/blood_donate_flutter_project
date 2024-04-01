import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/area_res.dart';
import '../../../../data/models/network_response.dart';
import '../../../../data/models/request/registration_req.dart';
import '../../../../data/repositories/auth_repository.dart';
import '../../../../data/repositories/location_repository.dart';
import '../../../../routes/app_pages.dart';

class SignupController extends GetxController {
  final isLoading = false.obs;

  final showOtpVerificationField = true.obs; // Add the showOtpVerificationField variable

  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameTEController = TextEditingController();
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController mobileNumberTEController =
      TextEditingController();
  final TextEditingController otpTextEditController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();
  final TextEditingController weightTEController = TextEditingController();

  final isWeightOk = false.obs;
  final obscureText = false.obs;

  final selectedBloodGroup = ''.obs;

  final divisionList = <AreaModel>[].obs;
  final selectedDivision = ''.obs;

  final districtList = <AreaModel>[].obs;
  final selectedDistrict = ''.obs;

  final upzilaList = <AreaModel>[].obs;
  final selectedUpzila = ''.obs;

  final unionList = <AreaModel>[].obs;
  final selectedUnion = ''.obs;

  void onSelectedBloodGroup(String? val) {
    selectedBloodGroup.value = val ?? '';
    log('select blood group: $val');
  }

  void onSelectedDivision(String? val) {
    if (val != null && val.isNotEmpty) {
      // clear all the selected values and list
      selectedDistrict.value = '';
      selectedUpzila.value = '';
      selectedUnion.value = '';

      districtList.clear();
      upzilaList.clear();
      unionList.clear();

      getDistrict(id: val);

      selectedDivision.value = val;
    }
  }

  onSelectedDistrict(String? val) {
    if (val != null && val.isNotEmpty) {
      // clear all the selected values and list
      selectedUpzila.value = '';
      selectedUnion.value = '';

      upzilaList.clear();
      unionList.clear();

      getUpzila(id: val);

      selectedDistrict.value = val;
    }
  }

  onSelectedUpzila(String? val) {
    if (val != null && val.isNotEmpty) {
      // clear all the selected values and list
      selectedUnion.value = '';

      unionList.clear();

      getUnion(name: val);

      selectedUpzila.value = val;
    }
  }

  onSelectedUnion(String? val) {
    if (val != null && val.isNotEmpty) {
      selectedUnion.value = val;
    }
  }

  // Add OTP verification logic here
  void toggleOtpVerificationField(bool value) {
    showOtpVerificationField.value = value;
  }


  //Future<bool> validateOTP() async {
    // Implement your OTP validation logic here
    // Return true if OTP is valid, false otherwise
    // For example:
    // if (otpTextEditController.text == '1234') {
    //   return true;
    // } else {
    //   return false;
    // }
  //}

  Future<void> registration(RegistrationReq params) async {
    if (formKey.currentState!.validate()) {
      NetworkResponse response = await AuthRepository.registration(params);
      isLoading.value = false;
      if (response.isSuccess) {
        clearTextFields();
        isLoading.value = false;
        Get.toNamed(Routes.LOGIN);
        Get.snackbar('Welcome To', 'Largest Blood Donor Family');
      } else {
        isLoading.value = false;
        Get.snackbar('Error', response.message ?? 'Account Creation Fail!');
      }
    }
  }

  @override
  void onInit() {
    getDivision();
    super.onInit();
  }

  Future<void> getDivision() async {
    isLoading.value = true;
    final NetworkResponse response = await LocationRepository.getDivision();
    divisionList.value = areaFromJson(response.jsonResponse!).data ?? [];
    isLoading.value = false;

  }

  Future<void> getDistrict({required String id}) async {
    isLoading.value = true;
    final NetworkResponse response =
        await LocationRepository.getDistrict(id: id);
    districtList.value = areaFromJson(response.jsonResponse!).data ?? [];
    isLoading.value = false;
  }

  Future<void> getUpzila({required String id}) async {
    isLoading.value = true;
    final NetworkResponse response = await LocationRepository.getUpzila(id: id);
    upzilaList.value = areaFromJson(response.jsonResponse!).data ?? [];
    isLoading.value = false;
  }

  Future<void> getUnion({required String name}) async {
    isLoading.value = true;
    NetworkResponse response = await LocationRepository.getUnion(name: name);
    unionList.value = areaFromJson(response.jsonResponse!).data ?? [];
    isLoading.value = false;
  }

  void clearTextFields() {
    usernameTEController.clear();
    emailTEController.clear();
    dobController.clear();
    mobileNumberTEController.clear();
    passwordTEController.clear();
  }
}
