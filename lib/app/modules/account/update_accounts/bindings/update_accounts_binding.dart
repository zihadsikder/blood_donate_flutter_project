import 'package:get/get.dart';

import '../controllers/update_accounts_controller.dart';

class UpdateAccountsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateAccountsController>(
      () => UpdateAccountsController(),
    );
  }
}
