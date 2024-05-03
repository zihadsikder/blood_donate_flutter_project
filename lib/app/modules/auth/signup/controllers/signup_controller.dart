import 'dart:async';
import 'dart:developer';
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
import '../views/register_otp_verify.dart';

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

  final remainingTime = '5:00'.obs; // Initial time is 300 seconds

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

  @override
  void onInit() {
    //startTimer();
    getDivision();
    super.onInit();
  }

  void startTimer() {
    int totalTimeInSeconds = 300; // 5 minutes
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      totalTimeInSeconds--;
      if (totalTimeInSeconds <= 0) {
        timer.cancel(); // Stop the timer when time's up
        remainingTime.value = 'Time\'s Up'; // Set time's up message
        return;
      }
      int minutes = totalTimeInSeconds ~/ 60;
      int seconds = totalTimeInSeconds % 60;
      remainingTime.value = '$minutes:${seconds.toString().padLeft(2, '0')}';
    });
  }

  void verifyOtp(mobile) async {
    if (otpFormKey.currentState!.validate()) {
      isLoading.value = true;

      final otp = otpTextEditController.text.trim();
      final response = await AuthRepository.verifyOtp(mobile, otp);

      isLoading.value = false;

      if (response.isSuccess && response.jsonResponse != null) {
        LoginRes loginRes = loginResFromJson(response.jsonResponse!);

        AuthCache.to.saveUserInformation(
          loginRes.data?.accessToken ?? '',
          loginRes,
        );
        Get.offAllNamed(Routes.BOTTOM_NAV);
        Get.snackbar('Message', response.message ?? 'Something Error!');
      }
    }
  }

  void resendOtp(mobile) async {
    isLoading.value = true;

    final response =
        await AuthRepository.resendOtp(mobile); // Pass the mobile number
    isLoading.value = false;

    if (response.isSuccess) {
      startTimer();
      Get.off(
        () => RegisterPinVerification(mobile: mobile),
      );

      Get.snackbar('Message', response.message ?? 'Something Error!');

    }
  }

  Future<void> registration(RegistrationReq params) async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      NetworkResponse response = await AuthRepository.registration(params);

      isLoading.value = false;

      if (response.isSuccess) {
        startTimer();
        Get.to(() => RegisterPinVerification(mobile: params.mobile));
        Get.snackbar('Message', response.message ?? 'Something Error!');
      }
    }
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
