import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/area_res.dart';
import '../../../data/models/network_response.dart';
import '../../../data/models/search_user_model.dart';
import '../../../data/repositories/location_repository.dart';
import '../../../services/api_client.dart';
import '../../../services/api_end_points.dart';
import '../../../services/network.dart';
import '../views/search_view.dart';

class HomeController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final connectivityController = Get.find<ConnectivityController>();

  final searchUser = SearchUserModel().obs;
  final isLoading = false.obs;

  final selectedBloodGroup = ''.obs;

  final divisionList = <AreaModel>[].obs;
  final selectedDivision = ''.obs;

  final districtList = <AreaModel>[].obs;
  final selectedDistrict = ''.obs;

  final upzilaList = <AreaModel>[].obs;
  final selectedUpzila = ''.obs;

  void onSelectedBloodGroup(String? val) {
    selectedBloodGroup.value = val ?? '';
  }

  void onSelectedDivision(String? val) {
    if (val != null && val.isNotEmpty) {
      selectedDistrict.value = '';
      selectedUpzila.value = '';

      districtList.clear();
      upzilaList.clear();
      getDistrict(id: val);
      selectedDivision.value = val;
    }
  }

  onSelectedDistrict(String? val) {
    if (val != null && val.isNotEmpty) {
      selectedUpzila.value = '';
      upzilaList.clear();
      getUpzila(id: val);
      selectedDistrict.value = val;
    }
  }

  onSelectedUpzila(String? val) {
    if (val != null && val.isNotEmpty) {
      selectedUpzila.value = val;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getDivision();
    connectivityController;
  }

  Future<void> getDivision() async {
    isLoading.value = true;
    final NetworkResponse response = await LocationRepository.getDivision();

    if (response.isSuccess && response.jsonResponse != null) {
      divisionList.value = areaFromJson(response.jsonResponse!).data ?? [];
    }
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

  Future<bool> searchDonor(
    String bloodGroup,
    String division,
    String district,
    String upzila,
  ) async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      final response =
          await ApiClient().getRequest("${ApiEndPoints.getSearchDonor}"
              "blood_group=$bloodGroup"
              "&division_id=$division"
              "&district_id=$district"
              "&area_id=$upzila"
              //"&post_office=$postOffice"
              );

      isLoading.value = false;

      if (response.isSuccess) {
        searchUser.value = searchUserModelFromJson(response.jsonResponse!);
        //Get.snackbar('Message', response.message ?? 'Try Again Later');

        return true;
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            title: 'Search Donor Fail',
            duration: Duration(seconds: 2),
            isDismissible: true,
            message: 'No donor found at this moment',
          ),
        );
        return false;
      }
    }
    return false;
  }
}
