import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_assets.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.navigateNext();
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              AppAssets.logo,
              width: 120,
            ),
            const SizedBox(height: 16),
            const Text('বাচাঁতে চাই একটি প্রাণ'),
            const Text('তাইতো করবো রক্তদান'),
            const Spacer(),
            const CircularProgressIndicator(),
            const SizedBox(height: 8.0),
            const Text('Version 1.1.1'),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
