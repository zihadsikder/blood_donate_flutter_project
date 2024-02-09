import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData lightThemeData = ThemeData(
    primaryColor: Colors.red.shade900,
    primarySwatch: Colors.red,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red.shade900,
        foregroundColor: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.white,
      ),
      backgroundColor: Colors.red.shade900,
      foregroundColor: Colors.white,
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
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(color: Colors.red.shade100)),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        // Add other styles as needed
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      // contentPadding: const EdgeInsets.symmetric(
      //   horizontal: 16,
      //   vertical: 8,
      // ),
      fillColor: Colors.white,
      filled: true,
      border: OutlineInputBorder(borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      hintStyle: TextStyle(
        color: Colors.grey,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.grey.shade600,
      ),
    ),
  );
}