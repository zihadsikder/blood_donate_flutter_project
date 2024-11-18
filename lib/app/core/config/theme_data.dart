import 'package:blood_bd/app/core/config/app_colors.dart';
import 'package:blood_bd/app/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData lightThemeData = ThemeData(
    primaryColor: AppColors.primaryColor,
    primarySwatch: Colors.green,
    useMaterial3: false,
    // colorScheme: ColorScheme.fromSwatch(
    //       primarySwatch: Colors.red
    //     ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonColor,
        foregroundColor: AppColors.secondaryColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        textStyle: AppTextStyles.buttonStyle(),
      ),
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle:AppTextStyles.buttonStyle(),
      backgroundColor: AppColors.buttonColor,
      foregroundColor: AppColors.secondaryColor,
      elevation: 5,
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 2, color: Colors.red.shade200),
        borderRadius: BorderRadius.circular(20),
      ),
      tileColor: Colors.white70,
    ),
    cardTheme: CardTheme(
      //elevation: 0.5,
      //shadowColor: Colors.red.shade700,
      color: AppColors.secondaryColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(color: Colors.red.shade100)),
    ),
    // textButtonTheme: TextButtonThemeData(
    //   style: ButtonStyle(
    //     padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
    //       const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //     ),
    //     backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
    //     textStyle: MaterialStateProperty.all<TextStyle>(
    //       const TextStyle(
    //         fontWeight: FontWeight.bold,
    //       ),
    //     ),
    //     // Add other styles as needed
    //   ),
    // ),
    inputDecorationTheme: InputDecorationTheme(
      // contentPadding: const EdgeInsets.symmetric(
      //   horizontal: 16,
      //   vertical: 8,
      // ),
      fillColor: AppColors.secondaryColor,
      filled: true,
      border: const OutlineInputBorder(borderSide: BorderSide.none),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      hintStyle: TextStyle(
        color: AppColors.hintStyle,
      ),
    ),
  );
}