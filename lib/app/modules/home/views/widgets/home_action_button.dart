import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../routes/app_pages.dart';

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
          backgroundColor: Colors.transparent,
          builder: (BuildContext) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), // No border
                    color:
                    Colors.white70, // Background color of the container
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.add_a_photo_outlined),
                        title: const Text(
                            'আপনার রক্ত ডোনেশনের ছবি ফেসবুকে শেয়ার করে অন্যদের উৎসাহিত করুন!'),
                        onTap: () {
                          // Implement the functionality for sharing donation picture in FB
                          // final fbUrl =
                          //     'https://www.facebook.com/groups/provater.surjo.bloodbank/?ref=share&mibextid=NSMWBT';
                          // canLaunch(fbUrl).then(
                          //       (canLaunch) {
                          //     if (canLaunch) {
                          //       launch(fbUrl);
                          //     }
                          //
                          //   },
                          // );
                          launch('https://www.facebook.com/groups/provater.surjo.bloodbank/?ref=share&mibextid=NSMWBT',
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.bloodtype_sharp),
                        title: const Text(
                            'রক্ত দেওয়ার পর আপনার ডোনেশন হিস্টোরি এড করে প্রোফাইল লক রাখুন!'),
                        onTap: () {
                          Get.toNamed(Routes.DONATION_HISTORY);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.share_outlined),
                        title: const Text(
                            'এ্যাপটি সবার সাথে শেয়ার করে রক্তদান প্রক্রিয়া আরো সহজ করে তুলুন!'),
                        onTap: () {
                          const appLink =
                              'https://play.google.com/store/apps/details?id=com.bloodbd.app';
                          Share.share(
                              'Check out this awesome app: $appLink');
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: const Icon(Icons.add_circle_outline),
    );
  }
}