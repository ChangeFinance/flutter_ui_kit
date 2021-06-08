import 'package:flutter_ui_kit/widgets/button_common.dart';
import 'package:flutter_ui_kit/widgets/outlined_button.dart';
import 'package:flutter/material.dart';
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
      buildButton: ({FutureCallback? onPressed}) =>
          ChgOutlinedButton(buttonText, onPressed: onPressed),
    );

    testTextProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: () => ChgOutlinedButton(buttonText, onPressed: () {} as Future<void> Function()?),
    );

    testOnPressedProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({FutureCallback? onPressed}) =>
          ChgOutlinedButton(buttonText, onPressed: onPressed),
      underlyingMaterialButtonType: OutlineButton,
    );

    testFullWidthProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({bool? fullWidth}) =>
          ChgOutlinedButton(buttonText, onPressed: () {} as Future<void> Function()?, fullWidth: fullWidth),
      underlyingMaterialButtonType: OutlineButton,
    );

    testNarrowProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({bool? narrow}) =>
          ChgOutlinedButton(buttonText, onPressed: () {} as Future<void> Function()?, narrow: narrow),
      underlyingMaterialButtonType: OutlineButton,
    );

    testPaddingProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({EdgeInsetsGeometry? padding}) =>
          ChgOutlinedButton(buttonText, onPressed: () {} as Future<void> Function()?, padding: padding),
      underlyingMaterialButtonType: OutlineButton,
    );

    testFontSize(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({bool? narrow, bool? fullWidth}) => ChgOutlinedButton(
            buttonText,
            onPressed: () {} as Future<void> Function()?,
            narrow: narrow,
            fullWidth: fullWidth,
          ),
    );
  });
}
