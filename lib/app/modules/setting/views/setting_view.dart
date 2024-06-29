import 'package:blood_bd/app/modules/setting/views/setting_screens/about_screens.dart';
import 'package:blood_bd/app/modules/setting/views/setting_screens/terms_conditions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/widgets/profile_summary_card.dart';
import '../../bottom_nav/controllers/bottom_nav_controller.dart';
import '../controllers/setting_controller.dart';
import 'setting_screens/diet_screen.dart';
import 'setting_screens/exercises_screen.dart';
import 'setting_screens/privacy_screen.dart';
import 'setting_screens/support.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        Get.find<BottomNavController>().backToHome();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                ProfileSummaryCard(),
                const SizedBox(
                  height: 8,
                ),
                ListTile(
                  shape: const RoundedRectangleBorder(
                    side: BorderSide.none,
                  ),
                  leading: Icon(Icons.read_more_outlined,
                      color: Colors.red.shade800),
                  title: const Text("About Us"),
                  onTap: () {
                    Get.to(const AboutInfoScreen());
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
                  leading:
                  Icon(Icons.star_rate_outlined, color: Colors.red.shade800),
                  title: const Text("Rate Us"),
                  onTap: () {
                    launch('https://play.google.com/store/apps/details?id=com.bloodbd.app');
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
                const SizedBox(
                  height: 8,
                ),
                ListTile(
                  shape: const RoundedRectangleBorder(
                    side: BorderSide.none,
                  ),
                  leading: Icon(Icons.playlist_add_check, color: Colors.red.shade800),
                  title: const Text('Terms &  Conditions'),
                  onTap: () {
                    Get.to(TermsAndConditionsPage());
                  },
                  trailing: const Icon(Icons.arrow_forward_ios, size: 20),
                ),
              ],
            ),
          ),
        ),
        // floatingActionButton: Padding(
        //   padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        //   child: SizedBox(
        //     width: double.infinity,
        //     child: ElevatedButton(
        //       onPressed: () {
        //         showDialog(
        //             barrierDismissible: false,
        //             context: context,
        //             builder: (context) =>
        //             const DonationScreen());
        //       },
        //       child: const Text('ডোনেশন করুন'),
        //     ),
        //   ),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
