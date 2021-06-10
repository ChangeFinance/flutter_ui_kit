import 'package:flutter/material.dart';

import 'package:flutter_ui_kit/text.dart';
import 'color.dart';

final ThemeData theme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  primarySwatch: AppColor.greenSwatch as MaterialColor?,
  canvasColor: AppColor.deepWhite,
  backgroundColor: AppColor.deepWhite,
  scaffoldBackgroundColor: AppColor.deepWhite,
  disabledColor: AppColor.mediumGrey,
  buttonTheme: _buttonTheme,
  textTheme: _textTheme
);

const Color primaryColor = AppColor.green;

TextTheme _textTheme = const TextTheme(
  headline1: AppText.header0,
  headline2: AppText.header1,
  headline3: AppText.header2,
  headline4: AppText.header3,
  headline6: AppText.header2,
  subtitle1: AppText.header4,
  bodyText1: AppText.body2,
  bodyText2: AppText.body1,
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
