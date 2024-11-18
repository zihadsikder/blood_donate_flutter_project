import 'package:blood_bd/app/core/config/app_colors.dart';
import 'package:blood_bd/app/core/constants/app_assets.dart';
import 'package:blood_bd/app/core/constants/app_text_style.dart';
import 'package:blood_bd/app/modules/home/views/widgets/home_action_button.dart';
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
                      const BannerCarousel(imageUrls: [
                        AppAssets.home1,
                        AppAssets.home2,
                        AppAssets.home3,
                        AppAssets.home4,
                        AppAssets.home5,
                      ]),
                      const SizedBox(height: 12),
                      ElevatedButton(
                          onPressed: () {
                            Get.to(() => SearchScreenView());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.search,
                                size: 32,
                                color:AppColors.textColor,
                              ),
                              const SizedBox(
                                width: 16
                              ),
                              Text(
                                'FIND DONOR/রক্তদাতা খুঁজুন',
                                style: AppTextStyles.textStyle(),
                              ),
                            ],
                          )),
                      Image.asset(AppAssets.homeView),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: const HomeActionButton(),
      ),
    );
  }
}

