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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController usernameTEController = TextEditingController();
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController mobileNumberTEController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();

  final isWeightOk = false.obs;
  final obscureText = true.obs;

  final isLoading = false.obs;

  String failMessage = '';
  String get failureMessage => failMessage;

  final selectedBloodGroup = 'A+'.obs;

  final divisionList = <AreaModel>[].obs;
  final selectedDivision = ''.obs;

  final districtList = <AreaModel>[].obs;
  final selectedDistrict = ''.obs;

  final upzilaList = <AreaModel>[].obs;
  final selectedUpzila = ''.obs;

  final unionList = <AreaModel>[].obs;
  final selectedUnion = ''.obs;

  String? onSelectedBloodGroup(String? val) {
    selectedBloodGroup.value = val ?? '';
    log('select blood group: $val');
    return val;
  }

  onSelectedDivision(String? val) {
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

      getUnion(id: val);

      selectedUpzila.value = val;
    }
  }

  onSelectedUnion(String? val) {
    if (val != null && val.isNotEmpty) {
      selectedUnion.value = val;
    }
  }

  Future<void> registration(RegistrationReq params) async {
    isLoading.value = true;
    NetworkResponse response = await AuthRepository.registration(params);
    if (response.isSuccess) {
      //successful snackbar
    } else {
      //error snackbar
    }
    isLoading.value = false;
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
    final NetworkResponse response = await LocationRepository.getDistrict(id: id);
    districtList.value = areaFromJson(response.jsonResponse!).data ?? [];
    isLoading.value = false;
  }

  Future<void> getUpzila({required String id}) async {
    isLoading.value = true;
    final NetworkResponse response = await LocationRepository.getUpzila(id: id);
    upzilaList.value = areaFromJson(response.jsonResponse!).data ?? [];
    isLoading.value = false;
  }

  Future<void> getUnion({required String id}) async {
    isLoading.value = true;
    NetworkResponse response = await LocationRepository.getUnion(id: id);
    unionList.value = areaFromJson(response.jsonResponse!).data ?? [];
    isLoading.value = false;
  }

  onPressHome() {
    Get.toNamed(Routes.HOME);
  }
}
