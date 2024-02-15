import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../core/widgets/profile_summary_card.dart';
import '../controllers/setting_controller.dart';
import 'setting_screens/diet_screen.dart';
import 'setting_screens/exercises_screen.dart';
import 'setting_screens/privacy_screen.dart';
import 'setting_screens/support.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.red.shade800,
        statusBarIconBrightness: Brightness.light));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ProfileSummaryCard(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    shape: const RoundedRectangleBorder(
                      side: BorderSide.none,
                    ),
                    leading:
                    Icon(Icons.support_agent, color: Colors.red.shade800),
                    title: const Text("Support"),
                    onTap: () {
                      Get.to(const Support());
                    },
                    trailing: const Icon(Icons.arrow_forward_ios, size: 20),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ListTile(
                    shape: const RoundedRectangleBorder(
                      side: BorderSide.none,
                    ),
                    leading: Icon(Icons.privacy_tip_outlined,
                        color: Colors.red.shade800),
                    title: const Text("Privacy Policy"),
                    onTap: () {
                      Get.to(const PrivacyScreen());
                    },
                    trailing: const Icon(Icons.arrow_forward_ios, size: 20),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ListTile(
                    shape: const RoundedRectangleBorder(
                      side: BorderSide.none,
                    ),
                    leading:
                    Icon(Icons.fitness_center, color: Colors.red.shade800),
                    title: const Text('Exercise Guidelines'),
                    onTap: () {
                      Get.to(const ExercisesScreen());
                    },
                    trailing: const Icon(Icons.arrow_forward_ios, size: 20),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ListTile(
                    shape: const RoundedRectangleBorder(
                      side: BorderSide.none,
                    ),
                    leading: Icon(Icons.fastfood, color: Colors.red.shade800),
                    title: const Text('Diet Chart'),
                    onTap: () {
                      Get.to(const DietChart());
                    },
                    trailing: const Icon(Icons.arrow_forward_ios, size: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
