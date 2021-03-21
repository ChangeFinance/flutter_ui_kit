import 'package:flutter/widgets.dart';
import 'package:flutter_ui_kit/widgets/button_common.dart';
import 'package:flutter_ui_kit/widgets/outlined_button.dart';
import 'package:flutter/material.dart' as mat;
import 'package:flutter_test/flutter_test.dart';

import 'common_button_tests.dart';

void main() {
  group('OutlinedButton', () {
    const buttonText = 'Click me';

    testPressingState(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({FutureCallback onPressed}) => OutlinedButton(
        buttonText,
        onPressed: onPressed,
      ),
    );

    testTextProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: () => OutlinedButton(
        buttonText,
        onPressed: () {},
      ),
    );

    testOnPressedProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({FutureCallback onPressed}) => OutlinedButton(
        buttonText,
        onPressed: onPressed,
      ),
      underlyingMaterialButtonType: mat.OutlineButton,
    );

    testFullWidthProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({bool fullWidth}) => OutlinedButton(
        buttonText,
        onPressed: () {},
        fullWidth: fullWidth,
      ),
      underlyingMaterialButtonType: mat.OutlineButton,
    );

    testNarrowProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({bool narrow}) => OutlinedButton(
        buttonText,
        onPressed: () {},
        narrow: narrow,
      ),
      underlyingMaterialButtonType: mat.OutlineButton,
    );

    testPaddingProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({EdgeInsetsGeometry padding}) => OutlinedButton(
        buttonText,
        onPressed: () {},
        padding: padding,
      ),
      underlyingMaterialButtonType: mat.OutlineButton,
    );

    testFontSize(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({bool narrow, bool fullWidth}) => OutlinedButton(
        buttonText,
        onPressed: () {},
        narrow: narrow,
        fullWidth: fullWidth,
      ),
    );
  });
}
