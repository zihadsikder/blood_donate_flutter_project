import 'package:blood_donate_flutter_project/app/modules/home/views/search_view.dart';
import 'package:blood_donate_flutter_project/app/modules/home/views/widgets/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../core/widgets/profile_summary_card.dart';

class HomeView extends GetView<SearchController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const ProfileSummaryCard(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: BannerCarousel(
                          imageUrls: [
                            'assets/rltn.png',
                            'assets/donation.png',
                            'assets/2.png',
                            'assets/3.png',
                            'assets/5.png',
                          ]
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                        onPressed: () {
                          Get.to(()=> SearchScreenView());
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
