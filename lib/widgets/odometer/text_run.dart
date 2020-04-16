import 'package:flutter/material.dart';

class TextRun {
  final String initialText;
  final String currentText;
  final TextStyle textStyle;

  TextRun(this.currentText, this.initialText, this.textStyle) : assert(isValidPair(currentText, initialText));

  static Size getSingleDigitSize(String digit, TextStyle textStyle) {
    return TextRun(digit, '0', textStyle).getSize();
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

  Size getSize() {
    final painter = TextPainter();
    painter.text = TextSpan(style: textStyle, text: '$currentText');
    painter.textDirection = TextDirection.ltr;
    painter.textAlign = TextAlign.left;
    painter.textScaleFactor = 1.0;
    painter.layout();

    if (currentText == '1') {
      return Size(painter.size.width + 1, painter.size.height);
    }

    return painter.size;
  }
}
