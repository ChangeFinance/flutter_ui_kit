import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/text.dart';
import 'package:flutter_ui_kit/theme.dart' as ui_kit;

import '../color.dart';
import 'colors.dart';

final ThemeData theme = ui_kit.theme.copyWith(
  inputDecorationTheme: _inputDecorationTheme,
  iconTheme: _iconTheme,
  toggleableActiveColor: AppColor.ltGreenPrimary,
  textTheme: const TextTheme(
    headline6: _headingStyle,
    bodyText2: _bodyStyle,
    bodyText1: _bodyStyle2,
    button: _buttonTextStyle,
    caption: _captionTextStyle,
    headline4: _appBarTitleStyle,
    headline3: AppText.header2,
    headline2: AppText.header1,
    subtitle1: _bodyStyle,
  ),
);

const _buttonTextStyle = const TextStyle(
  fontSize: 16.0,
  fontFamily: 'DINNextLTPro',
  fontWeight: FontWeight.w500,
);

const _iconTheme = const IconThemeData(size: 36.0);

const _textDisplayColor = const Color(0xFF9B9B9B);

const _headingStyle = const TextStyle(
  fontSize: 28,
  fontFamily: 'DINNextLTPro',
  fontWeight: FontWeight.w800,
  letterSpacing: 0,
  height: 0.7,
);

const TextStyle subHeadingStyle = const TextStyle(
  color: Colors.black,
  fontSize: 18.0,
  fontFamily: 'DINNextLTPro',
  fontWeight: FontWeight.w500,
);

const _bodyStyle = const TextStyle(
  color: Colors.black,
  fontSize: 14.0,
  fontFamily: 'DINNextLTPro',
  fontWeight: FontWeight.normal,
);

const _bodyStyle2 = const TextStyle(
  color: Colors.black,
  fontSize: 11.0,
  fontFamily: 'DINNextLTPro',
  fontWeight: FontWeight.normal,
  letterSpacing: 0.5,
);

const _captionTextStyle = const TextStyle(
  color: _textDisplayColor,
  fontSize: 11.0,
  fontFamily: 'DINNextLTPro',
  fontWeight: FontWeight.normal,
  letterSpacing: 0.5,
);

const _appBarTitleStyle = const TextStyle(
  color: AppColor.ltGreenPrimary,
  fontSize: 11.8,
  fontFamily: 'DINNextLTPro',
  fontWeight: FontWeight.w500,
  letterSpacing: 2.0,
);

const _inputStyle = const TextStyle(
  fontSize: 12.0,
  fontFamily: 'DINNextLTPro',
  fontWeight: FontWeight.w500,
);

const _inputHintStyle = const TextStyle(
  color: AppColors.hint,
  fontSize: 18.0,
  fontFamily: 'DINNextLTPro',
  fontWeight: FontWeight.normal,
);

const _inputHelperStyle = const TextStyle(
  color: AppColors.hint,
  fontSize: 12.0,
  fontFamily: 'DINNextLTPro',
  fontWeight: FontWeight.normal,
);

const _inputDecorationTheme = const InputDecorationTheme(
  labelStyle: _inputStyle,
  hintStyle: _inputHintStyle,
  helperStyle: _inputHelperStyle,
  prefixStyle: _bodyStyle,
  suffixStyle: _bodyStyle,
  contentPadding: const EdgeInsets.symmetric(
    vertical: 18.0,
    horizontal: 18.0,
  ),
);
