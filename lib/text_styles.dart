import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextStyles {
  const TextStyles._();

  // line height = lineheight_in_px / font_size
  // letter_spacing = letter_spacing_em / 0.0625
  static const letterSpacingConstant = 0.0625;
  static const _fontFamily = 'Circular';

  // ignore: non_constant_identifier_names
  static const TextStyle style_48_52_bold = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 48,
    height: 52 / 48,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.01 / letterSpacingConstant,
    color: Colors.black,
  );

  static const TextStyle style_40_60_regular = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 40,
    height: 60 / 40,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static const TextStyle style_32_36_bold = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 32,
    height: 36 / 32,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle style_24_36_bold = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    height: 36 / 24,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle style_20_30_regular = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    height: 30 / 20,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static const TextStyle style_16_24_regular = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    height: 24 / 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    letterSpacing: 0.02 / letterSpacingConstant,
  );

  static const TextStyle style_16_24_bold = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    height: 24 / 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    letterSpacing: 0.02 / letterSpacingConstant,
  );

  static const TextStyle style_14_20_regular = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    height: 20 / 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static const TextStyle style_10_14_regular = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 10,
    height: 14 / 10,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
}
