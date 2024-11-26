import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/area_res.dart';
import '../../../data/models/network_response.dart';
import '../../../data/models/search_user_model.dart';
import '../../../data/repositories/location_repository.dart';
import '../../../services/api_client.dart';
import '../../../services/api_end_points.dart';
import '../../../services/network.dart';

class HomeController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final connectivityController = Get.find<ConnectivityController>();

  final searchUser = SearchUserModel().obs;
  final isLoading = false.obs;
  final isFetchingMore = false.obs;

  final selectedBloodGroup = ''.obs;
  final divisionList = <AreaModel>[].obs;
  final selectedDivision = ''.obs;
  final districtList = <AreaModel>[].obs;
  final selectedDistrict = ''.obs;
  final upzilaList = <AreaModel>[].obs;
  final selectedUpzila = ''.obs;

  // Pagination state
  int currentPage = 1;
  int totalPages = 1;

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

  Future<void> searchDonor(
    String bloodGroup,
    String division,
    String district,
    String upzila, {
    bool isLoadMore = false,
  }) async {
    if (!isLoadMore && formKey.currentState!.validate()) {
      currentPage = 1; // Reset to the first page for fresh search
      searchUser.value = SearchUserModel(data: []);
    }

    if (currentPage > totalPages) return; // Prevent extra API calls

    isLoading.value = !isLoadMore;
    isFetchingMore.value = isLoadMore;

    final response = await ApiClient().getRequest(
      "${ApiEndPoints.getSearchDonor}"
      "blood_group=$bloodGroup"
      "&division_id=$division"
      "&district_id=$district"
      "&area_id=$upzila"
      "&page=$currentPage&limit=50",
    );

    isLoading.value = false;
    isFetchingMore.value = false;

    if (response.isSuccess) {
      final newSearchUser = searchUserModelFromJson(response.jsonResponse!);
      totalPages = newSearchUser.pagination?.totalPage ?? 1;
      currentPage++;

      searchUser.update((val) {
        val?.data?.addAll(newSearchUser.data ?? []);
      });
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Search Donor Fail',
          duration: Duration(seconds: 2),
          isDismissible: true,
          message: 'No donor found at this moment',
        ),
      );
    }
  }

  /// showExitConfirmationDialog
  Future<bool> showExitConfirmationDialog(BuildContext context) async {
    return await Get.dialog<bool>(
          AlertDialog(
            title: const Text("Exit App"),
            content: const Text("Are you sure you want to exit the app?"),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back(result: false); // Stay in the app
                },
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  Get.back(result: true); // Exit the app
                },
                child: const Text("Exit"),
              ),
            ],
          ),
        ) ??
        false; // Default to false if dialog is dismissed
  }
}
