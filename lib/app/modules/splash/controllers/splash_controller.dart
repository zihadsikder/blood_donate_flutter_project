import 'package:blood_donate_flutter_project/app/services/auth_cache.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

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
