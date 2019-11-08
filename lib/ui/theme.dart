
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/text.dart';
import 'package:flutter_ui_kit/theme.dart' as ui_kit;

import 'colors.dart';

final ThemeData theme = ui_kit.theme.copyWith(
    inputDecorationTheme: _inputDecorationTheme,
    iconTheme: _iconTheme,
    toggleableActiveColor: AppColors.primary,
    textTheme: const TextTheme(
      title: _headingStyle,
      body1: _bodyStyle,
      body2: _bodyStyle2,
      button: _buttonTextStyle,
      caption: _captionTextStyle,
      display1: _appBarTitleStyle,
      display2: AppText.header2,
      display3: AppText.header1,
      subhead: _bodyStyle,
    )
);

const _buttonTextStyle = const TextStyle(
  fontSize: 16.0,
  fontFamily: 'Circular',
  fontWeight: FontWeight.bold,
);

const _iconTheme = const IconThemeData(size: 36.0);

const _textDisplayColor = const Color(0xFF9B9B9B);

const _headingStyle = const TextStyle(
  fontSize: 28,
  fontFamily: 'Circular',
  fontWeight: FontWeight.w800,
  letterSpacing: 0,
  height: 0.7,
);

const TextStyle subHeadingStyle = const TextStyle(
  color: Colors.black,
  fontSize: 18.0,
  fontFamily: 'Circular',
  fontWeight: FontWeight.bold,
);

const _bodyStyle = const TextStyle(
  color: Colors.black,
  fontSize: 14.0,
  fontFamily: 'Circular',
  fontWeight: FontWeight.normal,
);

const _bodyStyle2 = const TextStyle(
  color: Colors.black,
  fontSize: 11.0,
  fontFamily: 'Circular',
  fontWeight: FontWeight.normal,
  letterSpacing: 0.5,
);

const _captionTextStyle = const TextStyle(
  color: _textDisplayColor,
  fontSize: 11.0,
  fontFamily: 'Circular',
  fontWeight: FontWeight.normal,
  letterSpacing: 0.5,
);

const _appBarTitleStyle = const TextStyle(
  color: AppColors.primary,
  fontSize: 11.8,
  fontFamily: 'Circular',
  fontWeight: FontWeight.bold,
  letterSpacing: 2.0,
);

const _inputStyle = const TextStyle(
  fontSize: 12.0,
  fontFamily: 'Circular',
  fontWeight: FontWeight.bold,
);

const _inputHintStyle = const TextStyle(
  color: AppColors.hint,
  fontSize: 18.0,
  fontFamily: 'Circular',
  fontWeight: FontWeight.normal,
);

const _inputHelperStyle = const TextStyle(
  color: AppColors.hint,
  fontSize: 12.0,
  fontFamily: 'Circular',
  fontWeight: FontWeight.normal,
);

const _inputDecorationTheme = const InputDecorationTheme(
    labelStyle: _inputStyle,
    hintStyle: _inputHintStyle,
    helperStyle: _inputHelperStyle,
    prefixStyle: _bodyStyle,
    suffixStyle: _bodyStyle,
    contentPadding:
        const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0));
