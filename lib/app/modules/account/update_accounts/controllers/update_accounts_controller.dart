import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/area_res.dart';
import '../../../../data/models/network_response.dart';
import '../../../../data/models/request/update_req.dart';
import '../../../../data/repositories/account_repository.dart';
import '../../../../data/repositories/location_repository.dart';

class UpdateAccountsController extends GetxController {

  final TextEditingController usernameTEController = TextEditingController();
  final TextEditingController dateTEController = TextEditingController();
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController mobileTEController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final inProgress = false.obs;

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

  @override
  void onInit() {
    getDivision();
    super.onInit();
  }

  Future<void> getDivision() async {
    inProgress.value = true;
    final NetworkResponse response = await LocationRepository.getDivision();
    divisionList.value = areaFromJson(response.jsonResponse!).data ?? [];
    inProgress.value = false;
  }

  Future<void> getDistrict({required String id}) async {
    inProgress.value = true;
    final NetworkResponse response =
    await LocationRepository.getDistrict(id: id);
    districtList.value = areaFromJson(response.jsonResponse!).data ?? [];
    inProgress.value = false;
  }

  Future<void> getUpzila({required String id}) async {
    inProgress.value = true;
    final NetworkResponse response = await LocationRepository.getUpzila(id: id);
    upzilaList.value = areaFromJson(response.jsonResponse!).data ?? [];
    inProgress.value = false;
  }

  Future<void> getUnion({required String name}) async {
    inProgress.value = true;
    NetworkResponse response = await LocationRepository.getUnion(name: name);
    unionList.value = areaFromJson(response.jsonResponse!).data ?? [];
    inProgress.value = false;
  }

  Future<void> updateProfile(UpdateReq params) async {
    if (formKey.currentState!.validate()) {
      NetworkResponse response = await AccountRepository.updateProfile(params);
      inProgress.value = false;
      if (response.isSuccess) {
        inProgress.value = true;
      } else {
        inProgress.value = false;
        Get.snackbar('Error', 'Profile Update Fail!');
      }
    }
  }
}
