import 'package:flutter_ui_kit/widgets/button_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/widgets/buttons/text_button.dart';

import '../common_button_tests.dart';

void main() {
  group('ChgTextButton', () {
    const buttonText = 'Click me';

    testPressingState(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({FutureCallback onPressed}) => ChgTextButton(
        buttonText,
        onPressed: onPressed,
      ),
    );

    testTextProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: () => ChgTextButton(
        buttonText,
        onPressed: () {},
      ),
    );

    testOnPressedProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({FutureCallback onPressed}) => ChgTextButton(
        buttonText,
        onPressed: onPressed,
      ),
      underlyingMaterialButtonType: FlatButton,
    );

    testPaddingProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({EdgeInsetsGeometry padding}) => ChgTextButton(
        buttonText,
        onPressed: () {},
        padding: padding,
      ),
      underlyingMaterialButtonType: FlatButton,
    );

    testFontStyle(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({TextStyle textStyle}) => ChgTextButton(
        buttonText,
        textStyle: textStyle,
        onPressed: () {},
      ),
    );
  });
}
