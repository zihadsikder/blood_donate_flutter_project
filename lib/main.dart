import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/core/config/binding.dart';
import 'app/core/config/theme_data.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'Blood Donor App',
      debugShowCheckedModeBanner: false,
      initialBinding: IntBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppThemeData.lightThemeData,
      themeMode: ThemeMode.system,
    ),
  );
}
