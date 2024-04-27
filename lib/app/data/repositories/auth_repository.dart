import '../../services/api_client.dart';
import '../../services/api_end_points.dart';
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

  static Future<NetworkResponse> verifyOtp(String mobile, String otp) async {
    final NetworkResponse response = await ApiClient().postRequest(
      ApiEndPoints.registerOtp,
      body: {"mobile": mobile, "otp": otp},
    );
    return response;
  }

  static Future<NetworkResponse> sendOtp(String mobile) async {
    final NetworkResponse response = await ApiClient().postRequest(
      ApiEndPoints.forgetPass,
      body: {"mobile": mobile},
    );
    return response;
  }
}
