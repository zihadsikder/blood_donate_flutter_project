import 'package:blood_donate_flutter_project/app/services/auth_cache.dart';
import 'package:get/get.dart';

import '../../modules/auth/controllers/auth_controller.dart';

class IntBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AuthCache(),
      fenix: true,
    );
  }
}
