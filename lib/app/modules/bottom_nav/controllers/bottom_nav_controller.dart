import 'package:get/get.dart';

class BottomNavController extends GetxController {

  int selectedIndex = 0;

  int get currentIndex => selectedIndex;

  void changeIndex(int index) {
    if (selectedIndex == index) {
      return;
    }
    selectedIndex = index;
  }

  void backToHome() {
    changeIndex(0);
  }

  //
  // @override
  // void onInit() {
  //   super.onInit();
  // }
  //
  // @override
  // void onReady() {
  //   super.onReady();
  // }
  //
  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
