import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/widgets/buttons/button_common.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/widgets/buttons/text_button.dart';

import '../common_button_tests.dart';

void main() {
  group('TextButton', () {
    const buttonText = 'Click me';

    testPressingState(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({FutureCallback onPressed}) => PlainButton(
        buttonText,
        onPressed: onPressed,
      ),
      underlyingMaterialButtonType: TextButton,
    );

    testTextProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: () => PlainButton(
        buttonText,
        onPressed: () {},
      ),
      underlyingMaterialButtonType: TextButton,
    );

    testOnPressedProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({FutureCallback onPressed}) => PlainButton(
        buttonText,
        onPressed: onPressed,
      ),
      underlyingMaterialButtonType: TextButton,
    );

    testPaddingProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({EdgeInsetsGeometry padding}) => PlainButton(
        buttonText,
        onPressed: () {},
        padding: padding,
      ),
      underlyingMaterialButtonType: TextButton,
    );

    testFontStyle(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({TextStyle textStyle}) => PlainButton(
        buttonText,
        textStyle: textStyle,
        onPressed: () {},
      ),
      underlyingMaterialButtonType: TextButton,
    );
  });
}
