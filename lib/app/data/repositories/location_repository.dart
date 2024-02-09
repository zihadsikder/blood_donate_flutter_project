import 'package:blood_donate_flutter_project/app/services/api_client.dart';
import 'package:blood_donate_flutter_project/app/services/api_end_points.dart';

import '../models/network_response.dart';

class LocationRepository {
 static Future<NetworkResponse> getDivision() async {
    final NetworkResponse response =
        await ApiClient().getRequest(ApiEndPoints.getDivisionData);
    if (response.isSuccess) {
      return response;
    } else {
      return response.copyWith(
          errorMessage: 'An error occurred while fetching Division data.');
    }
  }

  static Future<NetworkResponse> getDistrict({required String id}) async {
    final NetworkResponse response =
        await ApiClient().getRequest(ApiEndPoints.getDistrictData + id);

    if (response.isSuccess) {
      return response;
    } else {
      return response.copyWith(
          errorMessage: 'An error occurred while fetching District data.');
    }
  }

  static Future<NetworkResponse> getUpzila({required String id}) async {
    final NetworkResponse response =
        await ApiClient().getRequest(ApiEndPoints.getUpzilaData + id);
    if (response.isSuccess) {
      return response;
    } else {
      return response.copyWith(
          errorMessage: 'An error occurred while fetching Upzila data.');
    }
  }

  static Future<NetworkResponse> getUnion({required String id}) async {
    final NetworkResponse response =
        await ApiClient().getRequest(ApiEndPoints.getUnionData + id);
    if (response.isSuccess) {
      return response;
    } else {
      return response.copyWith(
          errorMessage: 'An error occurred while fetching Union data.');
    }
  }
}
