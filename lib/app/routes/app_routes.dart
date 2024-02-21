part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const SPLASH = _Paths.SPLASH;
  static const LOGIN = _Paths.LOGIN;
  static const SETTING = _Paths.SETTING;
  static const ACCOUNTS = _Paths.ACCOUNTS;
  static const SIGNUP = _Paths.SIGNUP;
  static const FORGOT_PASSWORD = _Paths.FORGOT_PASSWORD;
  static const BOTTOM_NAV = _Paths.BOTTOM_NAV;
  static const GOVT_SERVICES = _Paths.GOVT_SERVICES;
  static const NETWORK_ACTIVITY = _Paths.NETWORK_ACTIVITY;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const SPLASH = '/splash';
  static const SETTING = '/setting';
  static const ACCOUNTS = '/accounts';
  static const SIGNUP = '/signup';
  static const LOGIN = '/login';
  static const FORGOT_PASSWORD = '/forgot-password';
  static const BOTTOM_NAV = '/bottom-nav';
  static const GOVT_SERVICES = '/govt-services';
  static const NETWORK_ACTIVITY = '/network-activity';
}
