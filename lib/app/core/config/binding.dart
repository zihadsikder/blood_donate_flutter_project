import 'package:blood_donate_flutter_project/app/services/auth_cache.dart';
import 'package:get/get.dart';
import '../../modules/accounts/controllers/accounts_controller.dart';

class IntBinding extends Bindings {
  @override
  void dependencies() async {
    await Get.putAsync<AuthCache>(() async => await AuthCache().init());
    Get.lazyPut<AccountsController>(() => AccountsController());
    // Get.put(()=> HomeController());
    // Get.put(()=> NetworkActivityController());

  }
}
