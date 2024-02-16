import 'dart:convert';
import 'dart:developer';
import 'package:blood_donate_flutter_project/app/services/auth_cache.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../data/models/network_response.dart';

class ApiClient {
  final auth = Get.find<AuthCache>();
  Future<NetworkResponse> postRequest(String url, {Map<String, dynamic>? body, String? token}) async {
    try {
      log(url);
      log(body.toString());
      final response = await post(Uri.parse(url), body: jsonEncode(body), headers: {
        'Content-Type': 'application/json',
        'Authorization': AuthCache.to.checkAuthState() ? "Bearer ${AuthCache.to.getToken()}" : "",
      });
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        return NetworkResponse(
          isSuccess: true,
          jsonResponse: response.body,
          statusCode: 200,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          jsonResponse: jsonDecode(response.body),
        );
      }
    } catch (e) {
      return NetworkResponse(isSuccess: false, message: e.toString());
    }
  }

  Future<NetworkResponse> getRequest(String url, {String? token}) async {
    try {
      log(url);
      log(token.toString());
      final response = await get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Authorization': AuthCache.to.checkAuthState() ? "Bearer ${AuthCache.to.getToken()}" : "",
      });
      log(response.headers.toString());
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          isSuccess: true,
          jsonResponse: response.body,
          statusCode: 200,
        );
      } else if (response.statusCode == 401) {
        //backToLogin();
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          jsonResponse: jsonDecode(response.body),
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          jsonResponse: response.body,
        );
      }
    } catch (e) {
      return NetworkResponse(isSuccess: false, message: e.toString());
    }
  }

  Future<NetworkResponse> putRequest(String url, {Map<String, dynamic>? body, String? token}) async {
    try {
      log(url);
      log(body.toString());
      final response = await put(Uri.parse(url), body: jsonEncode(body), headers: {
        'Content-Type': 'application/json',
        'Authorization': AuthCache.to.checkAuthState() ? "Bearer ${AuthCache.to.getToken()}" : "",
      });
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        return NetworkResponse(
          isSuccess: true,
          jsonResponse: response.body,
          statusCode: 200,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          jsonResponse: jsonDecode(response.body),
        );
      }
    } catch (e) {
      return NetworkResponse(isSuccess: false, message: e.toString());
    }
  }

  Future<NetworkResponse> delRequest(String url, ) async {
    try {
      log(url);
      final response = await delete(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Authorization': AuthCache.to.checkAuthState() ? "Bearer ${AuthCache.to.getToken()}" : "",
      });
      log(response.headers.toString());
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          isSuccess: true,
          jsonResponse: response.body,
          statusCode: 200,
        );
      } else if (response.statusCode == 401) {
        //backToLogin();
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          jsonResponse: jsonDecode(response.body),
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          jsonResponse: response.body,
        );
      }
    } catch (e) {
      return NetworkResponse(isSuccess: false, message: e.toString());
    }
  }
}
