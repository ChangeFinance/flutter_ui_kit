import 'package:flutter/material.dart';

class TextRun {
  final String initialText;
  final String currentText;
  final TextStyle textStyle;

  TextRun(this.currentText, this.initialText, this.textStyle) : assert(isValidPair(currentText, initialText));

  static Size getSingleDigitSize(String digit, TextStyle textStyle, {double textScaleFactor = 1.0}) {
    return TextRun(digit, '0', textStyle).getSize(textScaleFactor: textScaleFactor);
  }

  static bool isNumberOrDot(String text) {
    return num.tryParse(text) != null || isDot(text);
  }

  static bool isDot(String text) => '.' == text;

  static bool isValidPair(String current, String initial) {
    if (isDot(initial) && !isDot(current)) {
      return false;
    }

    if ((!isDot(current) && current.endsWith('.')) || (!isDot(initial) && initial.endsWith('.'))) {
      return false;
    }
    return true;
  }

  Size getSize({double textScaleFactor = 1.0}) {
    final painter = TextPainter();
    painter.text = TextSpan(style: textStyle, text: '$currentText');
    painter.textDirection = TextDirection.ltr;
    painter.textAlign = TextAlign.left;
    painter.textScaleFactor = textScaleFactor;
    painter.layout();

    return painter.size;
  }
}
