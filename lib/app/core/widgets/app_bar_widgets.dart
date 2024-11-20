import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../config/app_colors.dart';

class AppBarWidgets extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarWidgets({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.buttonColor,
          statusBarIconBrightness: Brightness.light),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}