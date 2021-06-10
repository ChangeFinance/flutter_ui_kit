import 'package:flutter_ui_kit/theme.dart';
import 'package:flutter/material.dart';

MaterialApp wrapInMaterialApp(Widget? widget) {
  return MaterialApp(
    theme: theme,
    home: Scaffold(body: widget),
  );
}
