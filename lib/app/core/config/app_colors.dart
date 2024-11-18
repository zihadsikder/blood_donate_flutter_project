import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = Colors.red.shade900;
  static Gradient appGradient =  const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xff336f4a),Color(0xff86b560)],
    //colors: [Colors.red.shade900, Colors.red.shade600],
  );
  static Gradient appGradient2 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.red.shade800, Colors.red.shade400],
  );
  static Color bgColor = Colors.red.shade900;
  static const Color textColor = Color(0xffffffff);
  static const Color secondaryColor = Color(0xffffffff);
  static Color hintStyle = Colors.grey;
  static Color buttonColor = const Color(0xff43895f);
  static Color basicColor = const Color(0xff878585);
}