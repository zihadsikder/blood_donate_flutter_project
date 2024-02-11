import 'package:blood_donate_flutter_project/app/services/auth_cache.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 1), () {
      Get.toNamed(Routes.LOGIN);
    });
    //goToLogin();
  }

  // void goToLogin() async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   final bool isLoggedIn = await Get.find<AuthCache>().isLoggedIn();
  //   if (isLoggedIn) {
  //     Get.offNamed(Routes.BOTTOM_NAV);
  //   } else {
  //     Get.offNamed(Routes.LOGIN);
  //   }
  // }
}