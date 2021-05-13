import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/widgets/buttons/button_common.dart';
import 'package:flutter_ui_kit/widgets/buttons/two_states_button.dart';
import 'package:mockito/mockito.dart';

import '../../wrap_in_material_app.dart';
import '../common_button_tests.dart';

void main() {
  group('TwoStatesButton', () {
    const firstText = 'Ready';
    const secondText = 'Go';
    const timerInterval = 5;
    Future future;
    Completer completer;
    FutureCallback onButtonCallback;

    setUp(() {
      completer = Completer<void>();
      future = completer.future;
      onButtonCallback = FutureCallbackMock().call;
      when(onButtonCallback()).thenAnswer((_) => future);
    });

    void testSwitchTextProp({
      Function group,
      Function setUp,
      Function testWidgets,
      String firstText,
      String secondText,
      int timerInterval,
      Function buildButton,
      Type underlyingMaterialButtonType,
    }) {
      group('switch text prop', () {
        testWidgets('renders text', (WidgetTester tester) async {
          await tester.pumpWidget(wrapInMaterialApp(buildButton()));
          final button = findButtonStyleButton(underlyingMaterialButtonType);
          expect(button, isNotNull);
          await tester.pumpWidget(wrapInMaterialApp(buildButton(onButtonCallback: onButtonCallback)), Duration(seconds: timerInterval + 1));
          final Text child = button.child;
          expect(child.data, firstText);

          await tester.tap(find.text(secondText));
          await tester.pump();
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
      buildButton: ({FutureCallback onButtonCallback}) => TwoStatesButton(
        firstText,
        secondText,
        timerInterval,
        onButtonCallback: onButtonCallback,
        onPressed: () {},
      ),
      underlyingMaterialButtonType: ElevatedButton,
    );

    testOnPressedProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: firstText,
      buildButton: ({FutureCallback onPressed}) => TwoStatesButton(
        firstText,
        secondText,
        timerInterval,
        onPressed: onPressed,
        onButtonCallback: () {},
      ),
      underlyingMaterialButtonType: ElevatedButton,
    );

    testNarrowProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: firstText,
      buildButton: ({bool narrow}) => TwoStatesButton(firstText, secondText, timerInterval, onPressed: () {}, onButtonCallback: () {}, narrow: narrow),
      underlyingMaterialButtonType: ElevatedButton,
    );

    testPaddingProp(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: firstText,
      buildButton: ({EdgeInsetsGeometry padding}) => TwoStatesButton(firstText, secondText, timerInterval, onPressed: () {}, onButtonCallback: () {}, padding: padding),
      underlyingMaterialButtonType: ElevatedButton,
    );

    testFontSize(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: firstText,
      buildButton: ({bool narrow, bool fullWidth}) => TwoStatesButton(
        firstText,
        secondText,
        timerInterval,
        onPressed: () {},
        onButtonCallback: () {},
        narrow: narrow,
        fullWidth: fullWidth,
      ),
      underlyingMaterialButtonType: ElevatedButton,
    );

    testFontStyle(
      group: group,
      setUp: setUp,
      testWidgets: testWidgets,
      buttonText: firstText,
      buildButton: ({TextStyle textStyle}) => TwoStatesButton(
        firstText,
        secondText,
        timerInterval,
        textStyle: textStyle,
        onButtonCallback: () {},
        onPressed: () {},
        narrow: true,
      ),
      underlyingMaterialButtonType: ElevatedButton,
    );
  });
}
