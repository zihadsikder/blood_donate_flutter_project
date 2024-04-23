import '../../services/api_client.dart';
import '../../services/api_end_points.dart';
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

//   static Future<NetworkResponse> getUnion({required String name}) async {
//     final NetworkResponse response =
//         await ApiClient().getRequest(ApiEndPoints.getUnionData + name);
//     return response;
//   }
  }
