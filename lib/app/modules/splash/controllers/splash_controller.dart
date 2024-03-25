import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../services/auth_cache.dart';

class SplashController extends GetxController {


  void navigateNext() async {
    await Future.delayed(const Duration(seconds: 2));

    if (AuthCache.to.checkAuthState()) {
      Get.offNamed(Routes.BOTTOM_NAV);
    } else {
      Get.offNamed(Routes.LOGIN);
    }
  }
}
