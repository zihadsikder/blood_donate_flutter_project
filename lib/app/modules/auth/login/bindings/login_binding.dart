import 'package:get/get.dart';

import '../../../../services/network.dart';
import '../../../account/accounts/controllers/accounts_controller.dart';
import '../../../account/donation_history/controllers/donation_history_controller.dart';
import '../../../account/update_accounts/controllers/update_accounts_controller.dart';
import '../../../home/controllers/home_controller.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AccountsController>(() => AccountsController());
    Get.lazyPut<DonationHistoryController>(()=>DonationHistoryController());
    Get.lazyPut<UpdateAccountsController>(()=>UpdateAccountsController());
    Get.lazyPut<ConnectivityController>(() => ConnectivityController());
  }
}
