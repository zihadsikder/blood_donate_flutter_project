import 'package:blood_bd/app/modules/home/views/benefit_blood_donation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/config/app_colors.dart';


class HomeActionButton extends StatelessWidget {
  const HomeActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: AppColors.secondaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          builder: (BuildContext context) {
            return SafeArea(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                        side: BorderSide(color: AppColors.secondaryColor),
                      ),
                      leading: const Icon(Icons.add_a_photo_outlined),
                      title: const Text(
                          'আপনার রক্ত ডোনেশনের ছবি ফেসবুকে শেয়ার করে অন্যদের উৎসাহিত করুন!'),
                      onTap: () {
                        launch(
                          'https://www.facebook.com/groups/provater.surjo.bloodbank/?ref=share&mibextid=NSMWBT',
                        );
                      },
                      // onTap: () {
                      //   //Implement the functionality for sharing donation picture in FB
                      //   const fbUrl =
                      //       'https://www.facebook.com/groups/provater.surjo.bloodbank/?ref=share&mibextid=NSMWBT';
                      //   canLaunch(fbUrl).then(
                      //     (canLaunch) {
                      //       if (canLaunch) {
                      //         launch(fbUrl);
                      //       }
                      //     },
                      //   );
                      // },
                      trailing: const Icon(Icons.arrow_forward_ios, size: 20),
                    ),
                    ListTile(
                      shape: Border.all(color: Colors.transparent),
                      leading: const Icon(Icons.bloodtype_outlined),
                      title: const Text(
                          'রক্তদানের এসব উপকারের কথা কি জানতেন...!'),
                      onTap: () {
                        Get.to(()=> const BenefitBloodDonation());
                      },
                      trailing: const Icon(Icons.arrow_forward_ios, size: 20),
                    ),
                    ListTile(
                      shape: Border.all(color: Colors.transparent),
                      leading: const Icon(Icons.share_outlined),
                      title: const Text(
                          'এ্যাপটি সবার সাথে শেয়ার করে রক্তদান প্রক্রিয়া আরো সহজ করে তুলুন!'),
                      onTap: () {
                        const appLink =
                            'https://play.google.com/store/apps/details?id=roktersondane.com';
                        Share.share('Check out this awesome app: $appLink');
                        Navigator.of(context).pop();
                      },
                      trailing: const Icon(Icons.arrow_forward_ios, size: 20),
                    ),
                  ],
                ),
            );
          },
        );
      },
      child: const Icon(Icons.add_circle_outline),
    );
  }
}
