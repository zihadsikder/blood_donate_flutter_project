import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'app/core/config/binding.dart';
import 'app/core/config/theme_data.dart';
import 'app/routes/app_pages.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(MobileAds.instance.initialize());

  runApp(
    GetMaterialApp(
      title: 'Blood Donor App',
      debugShowCheckedModeBanner: false,
      initialBinding: IntBinding(),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: AppThemeData.lightThemeData,
      themeMode: ThemeMode.system,
    ),
  );
}
