import 'package:get/get.dart';

class BottomNavController extends GetxController {

  int selectedIndex = 0;

  int get currentIndex => selectedIndex;

  void changeIndex(int index) {
  if (selectedIndex == index) {
  return;
  }
  selectedIndex = index;
  update();
  }

  void backToHome() {
  changeIndex(0);
  }
}
