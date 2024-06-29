import 'package:blood_bd/app/modules/home/views/widgets/home_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/widgets/profile_summary_card.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'search_view.dart';
import 'widgets/banner_carousel.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                ProfileSummaryCard(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: BannerCarousel(imageUrls: [
                          'assets/rltn.png',
                          'assets/zihad.jpg',
                          'assets/fayez.jpg',
                          'assets/hand.jpeg',
                          'assets/5.png',
                        ]),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                          // onPressed: () {
                          //   // Display an Interstitial Ad
                          //   if (controller.interstitialAd != null) {
                          //     controller.interstitialAd!.show();
                          //   } else {
                          //     Get.to(() => SearchScreenView());
                          //   }
                          //   //Get.to(()=> SearchScreenView());
                          //   controller.loadInterstitialAd;
                          // },
                          onPressed: () {
                            Get.to(() => SearchScreenView());
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search,
                                size: 32,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                'FIND DONOR/রক্তদাতা খুঁজুন',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          )),
                      Image.asset('assets/savelife.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: HomeActionButton(),
      ),
    );
  }
}

