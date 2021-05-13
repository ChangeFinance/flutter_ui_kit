import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ui_kit/widgets/buttons/button_common.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/widgets/buttons/outlined_button.dart';

import '../common_button_tests.dart';

void main() {
  group('BorderedButton', () {
    const buttonText = 'Click me';

    testPressingState(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({FutureCallback onPressed}) => BorderedButton(buttonText, onPressed: onPressed),
      underlyingMaterialButtonType: OutlinedButton,
    );

    testTextProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: () => BorderedButton(buttonText, onPressed: () {}),
      underlyingMaterialButtonType: OutlinedButton,
    );

    testOnPressedProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({FutureCallback onPressed}) => BorderedButton(buttonText, onPressed: onPressed),
      underlyingMaterialButtonType: OutlinedButton,
    );

    testFullWidthProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({bool fullWidth}) => BorderedButton(buttonText, onPressed: () {}, fullWidth: fullWidth),
      underlyingMaterialButtonType: OutlinedButton,
    );

    testNarrowProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({bool narrow}) => BorderedButton(buttonText, onPressed: () {}, narrow: narrow),
      underlyingMaterialButtonType: OutlinedButton,
    );

    testPaddingProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({EdgeInsetsGeometry padding}) => BorderedButton(buttonText, onPressed: () {}, padding: padding),
      underlyingMaterialButtonType: OutlinedButton,
    );

    testFontSize(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({bool narrow, bool fullWidth}) => BorderedButton(
        buttonText,
        onPressed: () {},
        narrow: narrow,
        fullWidth: fullWidth,
      ),
      underlyingMaterialButtonType: OutlinedButton,
    );
  });
}
