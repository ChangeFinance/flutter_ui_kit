import 'package:flutter/material.dart';

import 'package:flutter_ui_kit/dark-text.dart';
import 'color.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: primaryColor,
  primarySwatch: AppColor.greenSwatch,
  canvasColor: AppColor.deepBlack,
  backgroundColor: AppColor.deepBlack,
  scaffoldBackgroundColor: AppColor.deepBlack,
  disabledColor: AppColor.mediumGrey,
  buttonTheme: _buttonTheme,
  textTheme: _textTheme
);

const Color primaryColor = AppColor.green;

TextTheme _textTheme = const TextTheme(
  display4: AppText.header0,
  display3: AppText.header1,
  display2: AppText.header2,
  display1: AppText.header3,
  title: AppText.header2,
  subhead: AppText.header4,
  body2: AppText.body2,
  body1: AppText.body1,
  caption: AppText.button1
);

ButtonThemeData _buttonTheme = ButtonThemeData(
  textTheme: ButtonTextTheme.accent,
  buttonColor: primaryColor,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
  disabledColor: AppColor.mediumGrey,
  highlightColor: AppColor.darkerGreen,
  minWidth: 48.0,
);
