import 'package:flutter_ui_kit/widgets/buttons/button_common.dart';
import 'package:flutter_ui_kit/widgets/buttons/filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common_button_tests.dart';

void main() {
  group('FilledButton', () {
    const buttonText = 'Click me';

    testTextProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: () => FilledButton(
        buttonText,
        onPressed: () {},
      ),
    );

    testOnPressedProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({FutureCallback onPressed}) => FilledButton(
        buttonText,
        onPressed: onPressed,
      ),
      underlyingMaterialButtonType: ElevatedButton,
    );

    testFullWidthProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({bool fullWidth}) => FilledButton(
        buttonText,
        onPressed: () {},
        fullWidth: fullWidth,
      ),
      underlyingMaterialButtonType: ElevatedButton,
    );

    testNarrowProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({bool narrow}) => FilledButton(
        buttonText,
        onPressed: () {},
        narrow: narrow,
      ),
      underlyingMaterialButtonType: ElevatedButton,
    );

    testPaddingProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({EdgeInsetsGeometry padding}) => FilledButton(
        buttonText,
        onPressed: () {},
        padding: padding,
      ),
      underlyingMaterialButtonType: ElevatedButton,
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
      underlyingMaterialButtonType: ElevatedButton,
    );

    testFontStyle(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({TextStyle textStyle}) => FilledButton(
        buttonText,
        textStyle: textStyle,
        onPressed: () {},
        narrow: true,
      ),
      underlyingMaterialButtonType: ElevatedButton,
    );
  });
}
