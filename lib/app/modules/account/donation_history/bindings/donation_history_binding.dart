import 'package:get/get.dart';

import '../controllers/donation_history_controller.dart';

class DonationHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DonationHistoryController>(
      () => DonationHistoryController(),
    );
  }
}
