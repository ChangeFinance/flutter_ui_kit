import 'package:flutter/material.dart';

class ScreenUtils {
  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width <= 380;
}
