import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/widgets/button_common.dart';
import 'package:flutter_ui_kit/widgets/two_states_button.dart';
import 'package:mocktail/mocktail.dart';

import '../wrap_in_material_app.dart';
import 'common_button_tests.dart';

class CallbackMock extends Mock implements Function {
  void call();
}

void main() {
  group('TwoStatesButton', ()
  {
    const firstText = 'Ready';
    const secondText = 'Go';
    const timerInterval = 5;

    void testSwitchTextProp({
      required Function group,
      Function? setUp,
      Function? testWidgets,
      String? firstText,
      String? secondText,
      int? timerInterval,
      Function? buildButton,
    }) {
      group('switch text prop', () {
        testWidgets!('renders text', (WidgetTester tester) async {
          final onButtonCallback = CallbackMock();
          await tester.pumpWidget(wrapInMaterialApp(buildButton!()));
          expect(find.text(firstText!), findsOneWidget);

          await tester.pumpWidget(wrapInMaterialApp(buildButton(onButtonCallback: onButtonCallback.call)), Duration(seconds: timerInterval! + 1));
          expect(find.text(secondText!), findsOneWidget);

          await tester.tap(find.text(secondText));
          await tester.pump();
          verify(onButtonCallback.call);
        });
      });
    }

    testSwitchTextProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      firstText: firstText,
      secondText: secondText,
      timerInterval: timerInterval,
      buildButton: ({VoidCallback? onButtonCallback}) => TwoStatesButton(firstText, secondText, timerInterval,
          onButtonCallback: onButtonCallback,
          onPressed: () async {}),
    );

    testOnPressedProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: firstText,
      buildButton: ({FutureCallback? onPressed}) =>
          TwoStatesButton(firstText, secondText, timerInterval, onPressed: onPressed,
            onButtonCallback: (){},),
      underlyingMaterialButtonType: RaisedButton,
    );

    testNarrowProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: firstText,
      buildButton: ({bool? narrow}) =>
          TwoStatesButton(firstText, secondText, timerInterval, onPressed: () async {},
              onButtonCallback: (){},
              narrow: narrow),
      underlyingMaterialButtonType: RaisedButton,
    );

    testPaddingProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: firstText,
      buildButton: ({EdgeInsetsGeometry? padding}) =>
          TwoStatesButton(firstText, secondText, timerInterval, onPressed: () async {},
              onButtonCallback: (){}, padding: padding),
      underlyingMaterialButtonType: RaisedButton,
    );

    testFontSize(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: firstText,
      buildButton: ({bool? narrow, bool? fullWidth}) => TwoStatesButton(
        firstText, secondText, timerInterval, onPressed: () async {},
        onButtonCallback: (){},
        narrow: narrow,
        fullWidth: fullWidth,
      ),
    );

    testFontStyle(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: firstText,
      buildButton: ({TextStyle? textStyle}) => TwoStatesButton(
        firstText, secondText, timerInterval,
        textStyle: textStyle,
        onButtonCallback: (){},
        onPressed: () async {},
        narrow: true,
      ),
    );
  });
}