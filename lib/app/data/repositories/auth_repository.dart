import 'package:blood_donate_flutter_project/app/services/api_client.dart';
import 'package:blood_donate_flutter_project/app/services/api_end_points.dart';

import '../models/network_response.dart';
import '../models/request/registration_req.dart';

class AuthRepository {
  static Future<NetworkResponse> registration(RegistrationReq params) async {
    final NetworkResponse response = await ApiClient().postRequest(
      ApiEndPoints.registration,
      body: params.toJson(),
    );

   return response;
  }

  static Future<NetworkResponse> login(String mobile, String password) async {
    final NetworkResponse response = await ApiClient().postRequest(
      ApiEndPoints.login,
      body: {"mobile": mobile, "password": password},
    );
    return response;
  }
}
