import 'dart:convert';

import 'package:blood_donate_flutter_project/app/data/models/request/registration_req.dart';
import 'package:blood_donate_flutter_project/app/data/repositories/auth_repository.dart';
import 'package:blood_donate_flutter_project/app/data/repositories/location_repository.dart';
import 'package:blood_donate_flutter_project/app/services/api_client.dart';
import 'package:blood_donate_flutter_project/app/services/api_end_points.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/district_res.dart';
import '../../../data/models/division_res.dart';
import '../../../data/models/network_response.dart';
import '../../../data/models/union_res.dart';
import '../../../data/models/upzila_res.dart';
import '../../../data/models/user_model.dart';
import '../../../routes/app_pages.dart';

class AuthController extends GetxController {
  final TextEditingController numberTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final obscureText = true.obs;

  final isLoading = false.obs;

  String failMessage = '';

  final TextEditingController usernameTEController = TextEditingController();
  final TextEditingController mobileNumberTEController =
      TextEditingController();
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  final weightOver50Controller = false.obs;

  String selectedBloodGroup = ' ';

  String _failMessage = '';

  String get failureMessage => _failMessage;

  List<Division>? divisionList;
  final selectedDivision = ''.obs;

  List<District>? districtList;
  final selectedDistrict = ''.obs;

  List<Upzila>? upzilaList;
  final selectedUpzila = ''.obs;

  List<Union>? unionList;
  final selectedUnion = ''.obs;

  onSelectedDivision(String val) {
    for (int i = 0; i < divisionList!.length; i++) {
      if (val == divisionList![i].id) {
        selectedDivision.value = divisionList![i].id;
      }
    }
    return null;
  }

  onSelectedDistrict(String val) {
    for (int i = 0; i < districtList!.length; i++) {
      if (val == districtList?[i].id) {
        selectedDistrict.value = districtList![i].id!;
      }
    }
    return null;
  }

  onSelectedUpzila(String val) {
    for (int i = 0; i < upzilaList!.length; i++) {
      if (val == upzilaList![i].id) {
        selectedUpzila.value = upzilaList![i].id!;
      }
    }
    return null;
  }

  onSelectedUnion(String val) {
    for (int i = 0; i < unionList!.length; i++) {
      if (val == unionList![i].id) {
        selectedUnion.value = unionList![i].id!;
      }
    }
    return null;
  }

  Future<void> registration(RegistrationReq params) async {
    isLoading.value = true;
    NetworkResponse response = await AuthRepository.registration(params);
    if (response.isSuccess) {
      //successful snackber
    } else {
      //error snackber
    }
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    getDivision();
  }

  Future<void> getDivision() async {
    isLoading.value = true;
    final NetworkResponse response = await LocationRepository.getDivision();
    divisionList = divisionFromJson(response.jsonResponse!).data;
    isLoading.value = false;
  }

  Future<void> getDistrict({required String id}) async {
    isLoading.value = true;
    final NetworkResponse response =
        await LocationRepository.getDistrict(id: id);
    districtList = mDistrictResponseFromJson(response.jsonResponse!).data;
    isLoading.value = false;
  }

  Future<void> getUpzila({required String id}) async {
    isLoading.value = true;
    final NetworkResponse response = await LocationRepository.getUpzila(id: id);
    upzilaList = upzilaResponseFromJson(response.jsonResponse!).data;
    isLoading.value = false;
  }

  Future<void> getUnion({required String id}) async {
    isLoading.value = true;
    NetworkResponse response = await LocationRepository.getUnion(id: id);
    unionList = unionResponseFromJson(response.jsonResponse!).data;
    isLoading.value = false;
  }

  Future<UserModel?> _getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    final String? strUserModel = sharedPreferences.getString('model');

    if (strUserModel == null) {
      return null;
    } else {
      return UserModel.fromJson(jsonDecode(strUserModel));
    }
  }

  Future<bool> login(String mobile, String password) async {
    isLoading.value = true;

    final NetworkResponse response = await ApiClient().postRequest(
      ApiEndPoints.login,
      body: {"mobile": mobile, "password": password},
    );
    isLoading.value = false;

    if (response.isSuccess && response.jsonResponse != null) {
      UserModel user = userModelFromJson(response.jsonResponse!);

      failMessage = ('Login Successfully');

      return true;
    } else {
      failMessage = ('Login failed. Try again');

      return false;
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  onPressHome() {
    Get.toNamed(Routes.HOME);
  }
}
