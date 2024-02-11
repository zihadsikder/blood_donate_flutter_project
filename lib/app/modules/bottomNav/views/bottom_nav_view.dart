import 'package:blood_donate_flutter_project/app/modules/home/views/home_view.dart';
import 'package:blood_donate_flutter_project/app/modules/setting/views/setting_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bottom_nav_controller.dart';

class BottomNavView extends GetView<BottomNavController> {
  const BottomNavView({super.key});

  final List<Widget> pages = const [
    HomeView(),
    //DashboardScreen(),
    //AccountScreen(),
    SettingView(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[controller.currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          // unselectedFontSize: 0,
          // selectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.red.shade900,
          onTap: controller.changeIndex,
          currentIndex: controller.currentIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey.shade500,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(label: ("Home"), icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: ("Dashboard"), icon: Icon(Icons.dashboard_outlined)),
            BottomNavigationBarItem(
                label: ("Account"), icon: Icon(Icons.person)),
            BottomNavigationBarItem(
                label: ("Settings"), icon: Icon(Icons.settings)),
          ],
        ),
      ),
    );
  }

}

