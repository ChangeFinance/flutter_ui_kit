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
      buildButton: () => ChgFilledButton(buttonText, onPressed: () async {}),
    );

    testOnPressedProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({FutureCallback? onPressed}) =>
          ChgFilledButton(buttonText, onPressed: onPressed),
      underlyingMaterialButtonType: RaisedButton,
    );

    testFullWidthProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({bool? fullWidth}) =>
          ChgFilledButton(buttonText, onPressed: () {} as Future<void> Function()?, fullWidth: fullWidth),
      underlyingMaterialButtonType: RaisedButton,
    );

    testNarrowProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({bool? narrow}) =>
          ChgFilledButton(buttonText, onPressed: () {} as Future<void> Function()?, narrow: narrow),
      underlyingMaterialButtonType: RaisedButton,
    );

    testPaddingProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({EdgeInsetsGeometry? padding}) =>
          ChgFilledButton(buttonText, onPressed: () {} as Future<void> Function()?, padding: padding),
      underlyingMaterialButtonType: RaisedButton,
    );

    testFontSize(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({bool? narrow, bool? fullWidth}) => ChgFilledButton(
            buttonText,
            onPressed: () {} as Future<void> Function()?,
            narrow: narrow,
            fullWidth: fullWidth,
          ),
    );

    testFontStyle(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: buttonText,
      buildButton: ({TextStyle? textStyle}) => ChgFilledButton(
          buttonText,
          textStyle: textStyle,
          onPressed: () {} as Future<void> Function()?,
          narrow: true,
      ),
    );
  });
}
