import 'package:flutter/material.dart';

typedef FutureCallback = Future<void> Function();

typedef EnabledSetter = void Function(bool enabled);

class ButtonStyleConstants {
  static const double narrowVerticalPadding = 11.5;
  static const double wideVerticalPadding = 17.5;
  static const double horizontalPadding = 48.0;
  static const EdgeInsetsGeometry narrowPadding = const EdgeInsets.symmetric(vertical: narrowVerticalPadding, horizontal: horizontalPadding);
  static const EdgeInsetsGeometry widePadding = const EdgeInsets.symmetric(vertical: wideVerticalPadding, horizontal: horizontalPadding);
  static const double fontSize = 16.0;
  static const double smallFontSize = 14.0;
}

mixin ButtonMixin {
  double matchParentWidth(BuildContext context) => MediaQuery.of(context).size.width;

  EdgeInsetsGeometry getPadding({bool narrow = false}) {
    return narrow ? ButtonStyleConstants.narrowPadding : ButtonStyleConstants.widePadding;
  }

  bool isDisabled({
    bool enabled,
    FutureCallback onPressed,
  }) {
    return !enabled || onPressed == null;
  }

  double getFontSize({bool narrow, bool fullWidth = false}) {
    if (_isSmall(narrow: narrow, fullWidth: fullWidth)) {
      return ButtonStyleConstants.smallFontSize;
    }
    return ButtonStyleConstants.fontSize;
  }

  Future<void> disableButtonWhileOnPressedExecutes({
    EnabledSetter setEnabled,
    FutureCallback onPressed,
  }) async {
    setEnabled(false);
    await onPressed();
    setEnabled(true);
  }

  bool _isSmall({bool narrow, bool fullWidth}) {
    return narrow && !fullWidth;
  }
}
