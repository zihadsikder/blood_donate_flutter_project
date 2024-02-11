// import 'package:blood_donate_flutter_project/app/modules/auth/views/login_view.dart';
// import 'package:blood_donate_flutter_project/app/modules/bottomNav/views/bottom_nav_view.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../../routes/app_pages.dart';
//
// class SplashController extends GetxController {
//
//   @override
//   void onInit() {
//     super.onInit();
//     checkLoggedIn();
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//   }
//
//   @override
//   void onClose() {
//     super.onClose();
//   }
//
//   Future<void> checkLoggedIn() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     String? token = sharedPreferences.getString('token');
//
//     if (token != null) {
//       //Get.toNamed(Routes.BOTTOM_NAV);
//       Get.off(() =>  BottomNavView());
//     } else {
//       //Get.toNamed(Routes.LOGIN);
//       Get.off(() => const LoginView());
//     }
//   }
// }
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();

    // Delay for 1 second and then navigate to the login screen
    Future.delayed(Duration(seconds: 1), () {
      Get.toNamed(Routes.LOGIN);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<bool> isLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');
    return token != null;

  }

}