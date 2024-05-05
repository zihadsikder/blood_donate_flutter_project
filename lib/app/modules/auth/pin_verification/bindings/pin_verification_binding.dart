import 'package:get/get.dart';

import '../controllers/pin_verification_controller.dart';

class PinVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PinVerificationController>(
      () => PinVerificationController(),
    );
  }
}
