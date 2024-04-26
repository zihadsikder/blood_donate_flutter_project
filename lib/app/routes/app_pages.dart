import 'package:get/get.dart';

import '../modules/account/accounts/bindings/accounts_binding.dart';
import '../modules/account/donation_history/bindings/donation_history_binding.dart';
import '../modules/account/donation_history/views/donation_history_view.dart';
import '../modules/account/accounts/views/accounts_view.dart';
import '../modules/account/update_accounts/bindings/update_accounts_binding.dart';
import '../modules/auth/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/auth/forgot_password/views/forget_password_view.dart';
import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/signup/bindings/signup_binding.dart';
import '../modules/auth/signup/views/sign_up_view.dart';
import '../modules/bottom_nav/bindings/bottom_nav_binding.dart';
import '../modules/bottom_nav/views/bottom_nav_view.dart';
import '../modules/govt_services/bindings/govt_services_binding.dart';
import '../modules/govt_services/views/govt_services_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/account/update_accounts/views/update_accounts_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNTS,
      page: () => AccountsView(),
      binding: AccountsBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignUpView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAV,
      page: () => BottomNavView(),
      binding: BottomNavBinding(),
    ),
    GetPage(
      name: _Paths.GOVT_SERVICES,
      page: () => GovtServicesView(),
      binding: GovtServicesBinding(),
    ),
    GetPage(
      name: _Paths.DONATION_HISTORY,
      page: () => const DonationHistoryView(),
      binding: DonationHistoryBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_ACCOUNTS,
      page: () =>  UpdateAccountsView(),
      binding: UpdateAccountsBinding(),
    ),
  ];
}
