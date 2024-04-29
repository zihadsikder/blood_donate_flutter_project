import 'dart:async';
import 'dart:developer';
import 'package:blood_bd/app/modules/auth/signup/views/register_pin_verification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/area_res.dart';
import '../../../../data/models/network_response.dart';
import '../../../../data/models/request/registration_req.dart';
import '../../../../data/models/user_model.dart';
import '../../../../data/repositories/auth_repository.dart';
import '../../../../data/repositories/location_repository.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/auth_cache.dart';

class SignupController extends GetxController {
  final isLoading = false.obs;

  final formKey = GlobalKey<FormState>();
  final otpFormKey = GlobalKey<FormState>();
  final TextEditingController usernameTEController = TextEditingController();
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController mobileNumberTEController =
      TextEditingController();
  final TextEditingController otpTextEditController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();
  final TextEditingController weightTEController = TextEditingController();
  final TextEditingController postOfficeTEController = TextEditingController();

  final isWeightOk = false.obs;
  final obscureText = false.obs;

  final remainingTime = 300.obs; // Initial time is 300 seconds
  // Countdown timer
  late Timer timer;

  final selectedBloodGroup = ''.obs;

  final divisionList = <AreaModel>[].obs;
  final selectedDivision = ''.obs;

  final districtList = <AreaModel>[].obs;
  final selectedDistrict = ''.obs;

  final upzilaList = <AreaModel>[].obs;
  final selectedUpzila = ''.obs;

  // final unionList = <AreaModel>[].obs;
  // final selectedUnion = ''.obs;

  void onSelectedBloodGroup(String? val) {
    selectedBloodGroup.value = val ?? '';
    log('select blood group: $val');
  }

  void onSelectedDivision(String? val) {
    if (val != null && val.isNotEmpty) {
      // clear all the selected values and list
      selectedDistrict.value = '';
      selectedUpzila.value = '';
      //selectedUnion.value = '';

      districtList.clear();
      upzilaList.clear();
      //unionList.clear();

      getDistrict(id: val);

      selectedDivision.value = val;
    }
  }

  onSelectedDistrict(String? val) {
    if (val != null && val.isNotEmpty) {
      // clear all the selected values and list
      selectedUpzila.value = '';
     // selectedUnion.value = '';
      upzilaList.clear();
      //unionList.clear();
      getUpzila(id: val);

      selectedDistrict.value = val;
    }
  }

  onSelectedUpzila(String? val) {
    if (val != null && val.isNotEmpty) {
      // clear all the selected values and list
      //selectedUnion.value = '';
      //unionList.clear();
      //getUnion(name: val);
      selectedUpzila.value = val;
    }
  }

  // onSelectedUnion(String? val) {
  //   if (val != null && val.isNotEmpty) {
  //     selectedUnion.value = val;
  //   }
  //}
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      remainingTime.value--;
      if (remainingTime.value <= 0) {
        timer.cancel(); // Stop the timer when time's up
        // You can add logic here for what to do when time's up
      }
    });
  }

  @override
  void onClose() {
    timer.cancel(); // Cancel the timer when the controller is closed
    super.onClose();
  }

  Future<void> verifyOtp() async {
    if (otpFormKey.currentState!.validate()) {
      isLoading.value = true;

      final mobile = mobileNumberTEController.text.trim();
      final otp = otpTextEditController.text.trim();

      final response = await AuthRepository.verifyOtp(mobile, otp);

      clearTextFields();

      isLoading.value = false;

      if (response.isSuccess && response.jsonResponse != null) {
        LoginRes loginRes = loginResFromJson(response.jsonResponse!);

        AuthCache.to.saveUserInformation(
          loginRes.data?.accessToken ?? '',
          loginRes,

        );
        Get.offAllNamed(Routes.BOTTOM_NAV);
        Get.snackbar('Welcome', 'You are a member of our society');
      }
    }
  }


  Future<void> registration(RegistrationReq params) async {
    if (formKey.currentState!.validate()) {
      NetworkResponse response = await AuthRepository.registration(params);
      isLoading.value = false;
      if (response.isSuccess) {

        isLoading.value = false;

        Get.to(()=> RegisterPinVerification(mobile : params.mobile));

        Get.snackbar('Message', 'An 6 digit OTP have been send your number');
        remainingTime.value = 300; // Reset time to 300 seconds
        startTimer();
      } else {
        isLoading.value = false;
      }
    }
  }

  @override
  void onInit() {
    getDivision();
    startTimer();
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

  // Future<void> getUnion({required String name}) async {
  //   isLoading.value = true;
  //   NetworkResponse response = await LocationRepository.getUnion(name: name);
  //   unionList.value = areaFromJson(response.jsonResponse!).data ?? [];
  //   isLoading.value = false;
  // }

  void clearTextFields() {
    usernameTEController.clear();
    emailTEController.clear();
    dobController.clear();
    mobileNumberTEController.clear();
    passwordTEController.clear();
    otpTextEditController.clear();
  }
}
