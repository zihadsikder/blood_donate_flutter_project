import 'package:blood_bd/app/core/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/network.dart';
import '../../account/accounts/views/accounts_view.dart';
import '../../govt_services/views/govt_services_view.dart';
import '../../home/views/home_view.dart';
import '../../setting/views/setting_view.dart';
import '../controllers/bottom_nav_controller.dart';

class BottomNavView extends GetView<BottomNavController> {
   BottomNavView({super.key});

  final List pages = [
    const HomeView(),
    const GovtServicesView(),
    const AccountsView(),
    const SettingView(),
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(ConnectivityController());
    return GetBuilder<BottomNavController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.secondaryColor,
          body: pages[controller.currentIndex],
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppColors.buttonColor,
              onTap: controller.changeIndex,
              currentIndex: controller.currentIndex,
              selectedItemColor: AppColors.secondaryColor,
              unselectedItemColor: Colors.grey.shade500,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(label: ("Home"), icon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    label: ("Services"), icon: Icon(Icons.dashboard_outlined)),
                BottomNavigationBarItem(
                    label: ("Account"), icon: Icon(Icons.person)),
                BottomNavigationBarItem(
                    label: ("Settings"), icon: Icon(Icons.settings)),
              ],
            ),
          ),
        );
      }
    );
  }
}
