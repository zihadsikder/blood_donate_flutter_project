import 'package:blood_donate_flutter_project/app/data/models/request/update_req.dart';
import 'package:blood_donate_flutter_project/app/data/repositories/account_repository.dart';
import 'package:blood_donate_flutter_project/app/routes/app_pages.dart';
import 'package:blood_donate_flutter_project/app/services/api_client.dart';
import 'package:blood_donate_flutter_project/app/services/api_end_points.dart';
import 'package:blood_donate_flutter_project/app/services/auth_cache.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/area_res.dart';
import '../../../data/models/donor_history_list_model.dart';
import '../../../data/models/network_response.dart';
import '../../../data/repositories/location_repository.dart';

class AccountsController extends GetxController {
  final TextEditingController placeTEController = TextEditingController();
  final TextEditingController dateTEController = TextEditingController();
  final TextEditingController usernameTEController = TextEditingController();
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController dobTEController = TextEditingController();
  final TextEditingController mobileTEController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AuthCache get authCache => Get.find<AuthCache>();

  final inProgress = false.obs;

  final isProfileActive = false.obs;

  String failMessage = '';

  String get failureMessage => failMessage;

  DonorHistoryList? donorHistoryList;

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

  Future<void> getUnion({required String id}) async {
    inProgress.value = true;
    NetworkResponse response = await LocationRepository.getUnion(id: id);
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
        failMessage = 'Update Profile Fail!';
      }
    }
  }

  Future<bool> addDonation() async {
    if (formKey.currentState!.validate()) {
      inProgress.value = true;

      final response = await ApiClient().postRequest(
        ApiEndPoints.storeDonationHistory,
        body: {
          "donation_place": placeTEController.text.trim(),
          "donation_date": dateTEController.text.trim(),
        },
      );
      inProgress.value = false;
      if (response.isSuccess) {
        placeTEController.text.trim();
        dateTEController.text.trim();
        clearTextFields();
        return true;
      } else {
        failMessage = 'Add Donation Fail!';
        return false;
      }
    }
    return false;
  }

  Future<bool> getDonationList() async {
    inProgress.value = true;

    final NetworkResponse response =
        await ApiClient().getRequest(ApiEndPoints.getDonorList);
    inProgress.value = false;
    if (response.isSuccess) {
      donorHistoryList = donorHistoryListFromJson(response.jsonResponse!);
      return true;
    } else {
      failMessage = 'Please Try Again Later';
    }

    return false;
  }

  Future<bool> deleteDonation({required String id}) async {
      inProgress.value = true;
      final response =
          await ApiClient().delRequest(ApiEndPoints.deleteDonation + id);
      inProgress.value = false;
      if (response.isSuccess) {
        Get.snackbar('Success', 'Delete Successful');
        return true;
      } else {
        Get.snackbar('Error', 'Something went wrong');
        return false;
      }
    }

  Future<bool> toggleProfileActivation(bool isActive) async {
      inProgress.value = true;
      try {
        final response = await ApiClient().putRequest(
            ApiEndPoints.profileActive,
            body: {"isActive": isActive});
        if (response.isSuccess) {
          return true;
        } else {
          return false;
        }
      } catch (e) {
        return false;
      }
  }

  Future<bool> logout() async {
      inProgress.value = true;
      final response =
          await ApiClient().postRequest(ApiEndPoints.logout, body: {});
      inProgress.value = false;
      if (response.isSuccess) {
        authCache.clearAuthData();
        Get.toNamed(Routes.LOGIN);
        return true;
      } else {
        const GetSnackBar(
          message: 'Something Error',
          duration: Duration(seconds: 1),
        );
      }
    return false;
  }

  void clearTextFields() {
    placeTEController.clear();
    dateTEController.clear();
  }
}
