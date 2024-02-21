import 'package:get/get.dart';

import '../controllers/network_activity_controller.dart';

class NetworkActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkActivityController>(
      () => NetworkActivityController(),
    );
  }
}
