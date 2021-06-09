import 'package:flutter_ui_kit/widgets/button_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/widgets/text_button.dart';

import 'common_button_tests.dart';

void main() {
  group('TextButton', () {
    const buttonText = 'Click me';

    testPressingState(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({FutureCallback? onPressed}) =>
          CngTextButton(buttonText, onPressed: onPressed),
    );

    testTextProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: () => CngTextButton(buttonText, onPressed: () {} as Future<void> Function()?),
    );

    testOnPressedProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({FutureCallback? onPressed}) =>
          CngTextButton(buttonText, onPressed: onPressed),
      underlyingMaterialButtonType: FlatButton,
    );

    testPaddingProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({EdgeInsetsGeometry? padding}) =>
          CngTextButton(buttonText, onPressed: () {} as Future<void> Function()?, padding: padding),
      underlyingMaterialButtonType: FlatButton,
    );

    testFontStyle(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({TextStyle? textStyle}) => CngTextButton(
        buttonText,
        textStyle: textStyle,
        onPressed: () {} as Future<void> Function()?
      ),
    );

  });
}
