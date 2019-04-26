import 'dart:async';

import 'package:change_ui_kit/widgets/button_common.dart';
import 'package:change_ui_kit/widgets/filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'common_button_test.dart';

void main() {
  group('FilledButton', () {
    const buttonText = 'Click me';

    testTextProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: () => FilledButton(buttonText, onPressed: () {}),
    );

    testOnPressedProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({FutureCallback onPressed}) =>
          FilledButton(buttonText, onPressed: onPressed),
      underlyingMaterialButtonType: RaisedButton,
    );

    testFullWidthProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({bool fullWidth}) =>
          FilledButton(buttonText, onPressed: () {}, fullWidth: fullWidth),
      underlyingMaterialButtonType: RaisedButton,
    );

    testNarrowProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({bool narrow}) =>
          FilledButton(buttonText, onPressed: () {}, narrow: narrow),
      underlyingMaterialButtonType: RaisedButton,
    );
  });
}
