import 'package:blood_bd/app/core/constants/app_text_style.dart';
import 'package:blood_bd/app/modules/setting/views/setting_screens/about_screens.dart';
import 'package:blood_bd/app/modules/setting/views/setting_screens/terms_conditions.dart';
import 'package:blood_bd/app/modules/setting/views/widget/list_title_widgets.dart';
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
                  height: 8
                ),
                GestureDetector(
                  onDoubleTap: (){
                    showDeveloperInfoDialog(context);
                  },
                  child: ListTitleWidgets(
                    icon: Icons.read_more_outlined,
                    text: "About Us",
                    onTap:  () {
                      Get.to(AboutInfoScreen());
                    },
                    trailingIcon: Icons.arrow_forward_ios,
                  ),
                ),
                const SizedBox(height: 8),
                ListTitleWidgets(
                  icon: Icons.support_agent,
                  text: "Support",
                  onTap:  () {
                    Get.to(const Support());
                  },
                  trailingIcon: Icons.arrow_forward_ios,
                ),
                const SizedBox(height: 8),
                ListTitleWidgets(
                  icon: Icons.privacy_tip_outlined,
                  text: "Privacy Policy",
                  onTap: () {
                    Get.to(const PrivacyScreen());
                  },
                  trailingIcon: Icons.arrow_forward_ios,
                ),
                const SizedBox(height: 8),
                ListTitleWidgets(
                  icon: Icons.playlist_add_check,
                  text: "Terms &  Conditions",
                  onTap:  () {
                    Get.to(const TermsAndConditionsPage());
                  },
                  trailingIcon: Icons.arrow_forward_ios,
                ),
                const SizedBox(height: 8),
                ListTitleWidgets(
                  icon: Icons.star_rate_outlined,
                  text: "Rate Us",
                  onTap:   () {
                    launch(
                        'https://play.google.com/store/apps/details?id=roktersondane.com');
                  },
                  trailingIcon: Icons.arrow_forward_ios,
                ),
                const SizedBox(height: 8),
                ListTitleWidgets(
                  icon: Icons.update_outlined,
                  text: "Check Update!",
                  onTap:   () {
                    launch(
                        'https://play.google.com/store/apps/details?id=roktersondane.com');
                  },
                  trailingIcon: Icons.arrow_forward_ios,
                ),
                const SizedBox(height: 8),
                ListTitleWidgets(
                  icon: Icons.fitness_center,
                  text: "Exercise Guidelines",
                  onTap:  () {
                    Get.to(const ExercisesScreen());
                    // Display an Interstitial Ad
                    // controller.showInterstitialAd(() {
                    //   Get.to(const ExercisesScreen());
                    // });
                  }, trailingIcon: Icons.arrow_forward_ios,
                ),
                const SizedBox(height: 8),
                ListTitleWidgets(
                  icon: Icons.fastfood,
                  text: "Diet Chart",
                  onTap:  () {
                    Get.to(const DietChart());
                    // Display an Interstitial Ad
                    // controller.showInterstitialAd(() {
                    //   Get.to(const DietChart());
                    // });
                  },
                  trailingIcon: Icons.arrow_forward_ios,
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
  void showDeveloperInfoDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: const Text("Developer Information"),
        content:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Name: Abu Sayed Md Zihad",style: AppTextStyles.textStyle(color: Colors.black),),
            const Text("Role: Software Engr."),
            const Text("Institution: B.Sc. in CSE from WUB"),
            const Text("Email: zihadsikder.engr@gmail.com"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(), // Close dialog
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }
}

