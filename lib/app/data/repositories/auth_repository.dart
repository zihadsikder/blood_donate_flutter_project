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

    if (response.isSuccess) {
      return response.copyWith(
          successMessage: 'Account has been created! Please Sign In.');
    } else {
      return response.copyWith(
          errorMessage: 'Account creation failed! Please try again.');
    }
  }
}
