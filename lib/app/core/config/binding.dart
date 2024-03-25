import 'package:get/get.dart';
import '../../modules/account/accounts/controllers/accounts_controller.dart';
import '../../modules/account/donation_history/controllers/donation_history_controller.dart';
import '../../modules/account/update_accounts/controllers/update_accounts_controller.dart';
import '../../modules/home/controllers/home_controller.dart';
import '../../services/auth_cache.dart';
import '../../services/network.dart';

class IntBinding extends Bindings {
  @override
  void dependencies() async {
    await Get.putAsync<AuthCache>(() async => await AuthCache().init());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AccountsController>(() => AccountsController());
    Get.lazyPut<DonationHistoryController>(()=>DonationHistoryController());
    Get.lazyPut<UpdateAccountsController>(()=>UpdateAccountsController());
    Get.lazyPut<ConnectivityController>(() => ConnectivityController());
  }
}
