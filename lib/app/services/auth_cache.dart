import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/user_model.dart';

class AuthCache extends GetxService{

  String? token;
  UserModel? userModel;

  Future<void> saveUserInformation(String token, UserModel userModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', token);
    await sharedPreferences.setString('model', userModelToJson(userModel));
    this.token = token;
    this.userModel = userModel;
  }

  Future<void> initialize() async {
    token = await _getToken();
    userModel = await _getUser();
  }

  Future<bool> isLoggedIn() async {
    await initialize();
    return token != null;
  }

  Future<String?> _getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('token');
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


  Future<bool> checkAuthState() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');
    if (token != null) {
      await initialize();
      return true;
    }
    return false;
  }

  Future<void> clearAuthData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  String? getAccessToken() {
    return token;
  }

}