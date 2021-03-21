import 'package:flutter_ui_kit/widgets/button_common.dart';
import 'package:flutter_ui_kit/widgets/buttons/filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common_button_tests.dart';

void main() {
  group('ChgFilledButton', () {
    const buttonText = 'Click me';

    testTextProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: () => ChgFilledButton(
        buttonText,
        onPressed: () {},
      ),
    );

    testOnPressedProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({FutureCallback onPressed}) => ChgFilledButton(
        buttonText,
        onPressed: onPressed,
      ),
      underlyingMaterialButtonType: RaisedButton,
    );

    testFullWidthProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({bool fullWidth}) => ChgFilledButton(
        buttonText,
        onPressed: () {},
        fullWidth: fullWidth,
      ),
      underlyingMaterialButtonType: RaisedButton,
    );

    testNarrowProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({bool narrow}) => ChgFilledButton(
        buttonText,
        onPressed: () {},
        narrow: narrow,
      ),
      underlyingMaterialButtonType: RaisedButton,
    );

    testPaddingProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({EdgeInsetsGeometry padding}) => ChgFilledButton(
        buttonText,
        onPressed: () {},
        padding: padding,
      ),
      underlyingMaterialButtonType: RaisedButton,
    );

    testFontSize(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({bool narrow, bool fullWidth}) => ChgFilledButton(
        buttonText,
        onPressed: () {},
        narrow: narrow,
        fullWidth: fullWidth,
      ),
    );

    testFontStyle(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({TextStyle textStyle}) => ChgFilledButton(
        buttonText,
        textStyle: textStyle,
        onPressed: () {},
        narrow: true,
      ),
    );
  });
}
