import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/user_model.dart';

class AuthCache extends GetxService {
  static AuthCache get to => Get.find<AuthCache>();

  late final SharedPreferences _prefs;

  Future<AuthCache> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  String? getToken() {
    return _prefs.getString('token');
  }

  UserModel? getUser() {
    final String? strUserModel = _prefs.getString('model');

    if (strUserModel == null) {
      return null;
    } else {
      return UserModel.fromJson(jsonDecode(strUserModel));
    }
  }

  Future<void> saveUserInformation(String token, UserModel userModel) async {
    await _prefs.setString('token', token);
    await _prefs.setString('model', userModelToJson(userModel));
  }

  bool checkAuthState() {
    String? token = _prefs.getString('token');
    if (token != null) {
      return true;
    }
    return false;
  }

  Future<bool?> clearAuthData() async {
    return await _prefs.clear();
  }
}
