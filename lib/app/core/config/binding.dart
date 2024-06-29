import 'package:blood_bd/app/modules/auth/forgot_password/controllers/forgot_password_controller.dart';
import 'package:blood_bd/app/modules/auth/login/controllers/login_controller.dart';
import 'package:blood_bd/app/modules/auth/pin_verification/controllers/pin_verification_controller.dart';
import 'package:blood_bd/app/modules/auth/signup/controllers/signup_controller.dart';
import 'package:blood_bd/app/modules/bottom_nav/controllers/bottom_nav_controller.dart';
import 'package:blood_bd/app/modules/govt_services/controllers/govt_services_controller.dart';
import 'package:blood_bd/app/modules/setting/controllers/setting_controller.dart';
import 'package:blood_bd/app/modules/splash/controllers/splash_controller.dart';
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

    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
    Get.lazyPut<SignupController>(() => SignupController());
    Get.lazyPut<PinVerificationController>(() => PinVerificationController());
    Get.lazyPut<GovtServicesController>(() => GovtServicesController());
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<SettingController>(() => SettingController());

    Get.lazyPut<BottomNavController>(() => BottomNavController());
  }
}
