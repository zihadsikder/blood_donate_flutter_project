import 'package:get/get.dart';

import '../controllers/govt_services_controller.dart';

class GovtServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GovtServicesController>(
      () => GovtServicesController(),
    );
  }
}
