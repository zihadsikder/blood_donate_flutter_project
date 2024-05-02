import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/profile_summary_card.dart';
import '../controllers/home_controller.dart';
import 'search_view.dart';
import 'widgets/banner_carousel.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    // TODO: lifecycle method should automatically call
    controller.onInit();

    return Scaffold(
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
                              'FIND DONOR',
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
    );
  }
}
