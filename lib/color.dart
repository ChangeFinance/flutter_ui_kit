import 'package:flutter/material.dart';

class AppColor {
  const AppColor._();
  static const Color green = Color(0xFF3EDBB5);
  static const Color greenSwatch = MaterialColor(500, {
    50: Color(0xFFE8FBF6),
    100: Color(0xFFC5F4E9),
    200: Color(0xFF9FEDDA),
    300: Color(0xFF78E6CB),
    400: Color(0xFF5BE0C0),
    500: green,
    600: Color(0xFF38D7AE),
    700: Color(0xFF30D2A5),
    800: Color(0xFF28CD9D),
    900: Color(0xFF1BC48D),
  });
  static Color paleGreen = green.withOpacity(0.2);
  static const Color darkerGreen = Color(0xFF39CCA8);
  static const Color brightGreen = Color(0xFF4CE2A7);

  static const Color deepBlack = Color(0xFF000000);
  static const Color deepWhite = Color(0xFFFFFFFF);

  static const Color red = Color(0xFFFF6B6B);

  static const Color veryLightGrey = Color(0xFFF7F7F7);
  static const Color lightestGrey = Color(0xFFEDEFF2);
  static const Color grey = Color(0xFFE7E7E7);
  static const Color mediumGrey = Color(0xFFE7E7E7);
  static const Color semiGrey = Color(0xFF9DA0A6);

  static const Color shadowColor = Color(0x1f0D0F10);
}
