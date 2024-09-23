import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../modules/home/views/search_view.dart';
import '../../modules/setting/controllers/setting_controller.dart';

class ProfileSummaryCard extends StatelessWidget {
  ProfileSummaryCard({
    super.key,
    this.enableOnTap = true,
  });

  final controller = Get.put(SettingController());

  final bool enableOnTap;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.red.shade800,
        statusBarIconBrightness: Brightness.light));
    controller.onInit();

    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Image.asset('assets/blogo.png'),
      ),
      title: const Text(
        'BLOOD SHEBA',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
      subtitle: const Text(
        'To be a Hero! Donate Blood.',
        style: TextStyle(color: Colors.white, fontSize: 10),
      ),
      trailing: IconButton(
        onPressed: () {
          Get.to(() => SearchScreenView());
          // Display an Interstitial Ad
          // controller.showInterstitialAd(() {
          //   Get.to(() => SearchScreenView());
          // });
        },
        icon: const Icon(Icons.search_outlined, color: Colors.white),
      ),
      tileColor: Colors.red.shade900,
    );
  }
}
