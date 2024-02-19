import 'package:blood_donate_flutter_project/app/data/models/network_response.dart';
import 'package:blood_donate_flutter_project/app/data/models/request/update_req.dart';

import '../../services/api_client.dart';
import '../../services/api_end_points.dart';

class AccountRepository {
  static Future<NetworkResponse> searchDonor(String bloodGroup, String division,
      String district, String upzila, String postOffice) async {
    final response =
        await ApiClient().getRequest("${ApiEndPoints.getSearchDonor}"
            "blood_group=$bloodGroup"
            "&division=$division"
            "&district=$district"
            "&area=$upzila"
            "&post_office=$postOffice");
    return response;
  }

  static Future<NetworkResponse> updateProfile(UpdateReq params) async {
    final NetworkResponse response = await ApiClient()
        .putRequest(ApiEndPoints.updateProfile, body: params.toJson());
    return response;
  }
}