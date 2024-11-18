import 'package:blood_bd/app/core/config/app_colors.dart';
import 'package:blood_bd/app/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../modules/home/views/search_view.dart';
import '../../modules/setting/controllers/setting_controller.dart';

class ProfileSummaryCard extends StatelessWidget {
  ProfileSummaryCard({super.key, this.enableOnTap = true});

  final SettingController controller = Get.put(SettingController());
  final bool enableOnTap;

  // Set System UI Overlay Style once in the constructor or controller
  void _setStatusBarStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xff43895f),
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Only set the status bar style once
    _setStatusBarStyle();

    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.appGradient,
        borderRadius: BorderRadius.circular(0), // Match the tile shape
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        leading: CircleAvatar(
          backgroundColor: AppColors.secondaryColor,
          child: Image.asset(AppAssets.profileSummary),
        ),
        title:  const Text(
          'রক্তের সন্ধ্যানে!',
          style: TextStyle(color: AppColors.secondaryColor, fontWeight: FontWeight.w700),
        ),
        subtitle: const Text(
          'To be a Hero! Donate Blood.',
          style: TextStyle(color: AppColors.secondaryColor, fontSize: 10),
        ),
        trailing: IconButton(
          onPressed: () {
            if (enableOnTap) {
              Get.to(() => SearchScreenView());
            }
          },
          icon:const Icon(Icons.search_outlined, color: AppColors.secondaryColor),
        ),
      ),
    );
  }
}
