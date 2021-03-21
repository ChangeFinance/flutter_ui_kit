import 'package:flutter/widgets.dart';
import 'package:flutter_ui_kit/widgets/button_common.dart';
import 'package:flutter/material.dart' as mat;
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
      buildButton: ({FutureCallback onPressed}) => TextButton(buttonText, onPressed: onPressed),
    );

    testTextProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: () => TextButton(buttonText, onPressed: () {}),
    );

    testOnPressedProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({FutureCallback onPressed}) => TextButton(buttonText, onPressed: onPressed),
      underlyingMaterialButtonType: mat.FlatButton,
    );

    testPaddingProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({EdgeInsetsGeometry padding}) => TextButton(buttonText, onPressed: () {}, padding: padding),
      underlyingMaterialButtonType: mat.FlatButton,
    );

    testFontStyle(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({TextStyle textStyle}) => TextButton(buttonText, textStyle: textStyle, onPressed: () {}),
    );
  });
}
