import 'package:flutter_ui_kit/widgets/button_common.dart';
import 'package:flutter_ui_kit/widgets/filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'common_button_tests.dart';

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

    testFontSize(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({bool narrow, bool fullWidth}) => FilledButton(
            buttonText,
            onPressed: () {},
            narrow: narrow,
            fullWidth: fullWidth,
          ),
    );
  });
}
