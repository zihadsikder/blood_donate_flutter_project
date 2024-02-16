import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/area_res.dart';
import '../../../data/models/network_response.dart';
import '../../../data/models/search_user_model.dart';
import '../../../data/repositories/location_repository.dart';
import '../../../services/api_client.dart';
import '../../../services/api_end_points.dart';

class HomeController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final searchUser = SearchUserModel().obs;
  final isLoading = false.obs;

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
    //log('select blood group: $val');
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

      getUnion(id: val);

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

  Future<void> getUnion({required String id}) async {
    isLoading.value = true;
    NetworkResponse response = await LocationRepository.getUnion(id: id);
    unionList.value = areaFromJson(response.jsonResponse!).data ?? [];
    isLoading.value = false;
  }

  //
  // @override
  // void onReady() {
  //   super.onReady();
  // }
  //
  // @override
  // void onClose() {
  //   super.onClose();
  // }

  Future<void> searchDonor(String bloodGroup, String division, String district,
      String upzila, String postOffice) async {
    if (formKey.currentState!.validate()) {

      isLoading.value = true;

      final response =
          await ApiClient().getRequest("${ApiEndPoints.getSearchDonor}"
              "blood_group=$bloodGroup"
              "&division_id=$division"
              "&district_id=$district"
              "&area_id=$upzila"
              "&post_office=$postOffice");

      isLoading.value = false;

      if (response.isSuccess) {
        searchUser.value = searchUserModelFromJson(response.jsonResponse!);

        isLoading.value = true;
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            title: 'Search Donor Fail',
            duration: Duration(seconds: 2),
            isDismissible: true,
            message: 'No donor found at this moment',
          ),
        );
        isLoading.value = false;
      }
    }
  }
}
