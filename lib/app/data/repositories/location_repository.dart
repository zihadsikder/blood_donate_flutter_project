import 'package:blood_donate_flutter_project/app/services/api_client.dart';
import 'package:blood_donate_flutter_project/app/services/api_end_points.dart';

import '../models/network_response.dart';

class LocationRepository {
 static Future<NetworkResponse> getDivision() async {
    final NetworkResponse response =
        await ApiClient().getRequest(ApiEndPoints.getDivisionData);
    return response;
  }

  static Future<NetworkResponse> getDistrict({required String id}) async {
    final NetworkResponse response =
        await ApiClient().getRequest(ApiEndPoints.getDistrictData + id);

    return response;
  }

  static Future<NetworkResponse> getUpzila({required String id}) async {
    final NetworkResponse response =
        await ApiClient().getRequest(ApiEndPoints.getUpzilaData + id);
    return response;
  }

  static Future<NetworkResponse> getUnion({required String id}) async {
    final NetworkResponse response =
        await ApiClient().getRequest(ApiEndPoints.getUnionData + id);
    return response;
  }
}
