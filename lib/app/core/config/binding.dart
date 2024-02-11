import 'package:blood_donate_flutter_project/app/services/auth_cache.dart';
import 'package:get/get.dart';

class IntBinding extends Bindings {
  @override
  void dependencies() async {
    await Get.putAsync<AuthCache>(() async => AuthCache().init());
  }
}
