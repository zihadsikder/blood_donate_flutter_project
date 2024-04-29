import 'package:get/get.dart';

import '../../../services/network.dart';

class BottomNavController extends GetxController {

  final connectivityController = Get.find<ConnectivityController>();

  @override
  void onInit() {
    super.onInit();
    connectivityController;
  }

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
