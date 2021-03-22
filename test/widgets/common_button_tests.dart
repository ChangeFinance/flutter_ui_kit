// @dart = 2.8

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/text.dart';
import 'package:flutter_ui_kit/widgets/buttons/button_common.dart';
import 'package:mockito/mockito.dart';

import '../wrap_in_material_app.dart';

class FutureCallbackMock extends Mock implements Function {
  Future<void> call();
}

const interactiveStates = <MaterialState>{
  MaterialState.pressed,
  MaterialState.hovered,
  MaterialState.focused,
};

void testTextProp({
  Function group,
  Function setUp,
  Function testWidgets,
  String buttonText,
  Function buildButton,
  Type underlyingMaterialButtonType,
}) {
  group('text prop', () {
    testWidgets('renders text', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(buildButton()));
      expect(find.text(buttonText), findsOneWidget);
    });
  });
}

void testOnPressedProp({
  Function group,
  Function setUp,
  Function testWidgets,
  String buttonText,
  Function buildButton,
  Type underlyingMaterialButtonType,
}) {
  group('onPressed prop', () {
    Future future;
    Completer completer;
    FutureCallback onPressed;

    setUp(() {
      completer = Completer<void>();
      future = completer.future;
      onPressed = FutureCallbackMock().call;
      when(onPressed()).thenAnswer((_) => future);
    });

    testWidgets('if onPressed is null should pass null to underlying button', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(buildButton(onPressed: null)));
      expect(tester.widget<ButtonStyleButton>(find.byType(underlyingMaterialButtonType)).enabled, isFalse);
    });

    testWidgets('on tap calls onPressed prop', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(buildButton(onPressed: onPressed)));
      await tester.tap(find.text(buttonText));
      await tester.pump();
      verify(onPressed()).called(1);
    });

    testWidgets('tapping twice results in one call to onPressed', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(buildButton(onPressed: onPressed)));
      await tester.tap(find.text(buttonText));
      await tester.pump();
      await tester.tap(find.text(buttonText));
      await tester.pump();
      verify(onPressed()).called(1);
    });

    testWidgets('when tapped disables underlying button until future completes', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(wrapInMaterialApp(buildButton(onPressed: onPressed)));
        await tester.tap(find.text(buttonText));
        await tester.pump();
        expect(tester.widget<ButtonStyleButton>(find.byType(underlyingMaterialButtonType)).enabled, isFalse);
        completer.complete();
        await future;
        await tester.pump();
        expect(tester.widget<ButtonStyleButton>(find.byType(underlyingMaterialButtonType)).enabled, isTrue);
      });
    });
  });
}

void testFullWidthProp({
  Function group,
  Function setUp,
  Function testWidgets,
  String buttonText,
  Function buildButton,
  Type underlyingMaterialButtonType,
}) {
  group('fullWidth prop', () {
    TestWidgetsFlutterBinding binding;

    setUp(() {
      binding = TestWidgetsFlutterBinding.ensureInitialized();
      binding.window.physicalSizeTestValue = const Size(400, 200);
      binding.window.devicePixelRatioTestValue = 1.0;
    });

    testWidgets('if true renders in full width', (WidgetTester tester) async {
      final Widget button = buildButton(fullWidth: true);
      await tester.pumpWidget(wrapInMaterialApp(button));
      final buttonWidth = tester.element(find.byType(button.runtimeType)).size.width;
      expect(buttonWidth, 400.0);
    });

    testWidgets('if false does not render full width', (WidgetTester tester) async {
      final Widget button = buildButton(fullWidth: false);
      await tester.pumpWidget(wrapInMaterialApp(button));

      final buttonWidth = tester.element(find.byType(button.runtimeType)).size.width;
      expect(buttonWidth, 224.0);
    });
  });
}

void testNarrowProp({
  Function group,
  Function setUp,
  Function testWidgets,
  String buttonText,
  Function buildButton,
  Type underlyingMaterialButtonType,
}) {
  group('narrow prop', () {
    testWidgets('if true renders smaller padding', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(buildButton(narrow: true)));
      final button = findButtonStyleButton(underlyingMaterialButtonType);
      expect(button.style.padding.resolve(interactiveStates), ButtonStyleConstants.narrowPadding);
    });

    testWidgets('if false renders larger padding', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(buildButton(narrow: false)));
      final button = findButtonStyleButton(underlyingMaterialButtonType);
      expect(button.style.padding.resolve(interactiveStates), ButtonStyleConstants.widePadding);
    });
  });
}

void testPaddingProp({
  Function group,
  Function setUp,
  Function testWidgets,
  String buttonText,
  Function buildButton,
  Type underlyingMaterialButtonType,
}) {
  group('padding prop', () {
    testWidgets('if padding is passed, overwrite default', (WidgetTester tester) async {
      const padding = const EdgeInsets.all(8.0);
      await tester.pumpWidget(wrapInMaterialApp(buildButton(padding: padding)));
      final button = findButtonStyleButton(underlyingMaterialButtonType);
      expect(button.style.padding.resolve(interactiveStates), padding);
    });

    testWidgets('if padding is null, defaults to', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(buildButton(padding: null)));
      final button = findButtonStyleButton(underlyingMaterialButtonType);
      expect(button.style.padding.resolve(interactiveStates).vertical, 2 * ButtonStyleConstants.wideVerticalPadding);
    });
  });
}

void testFontSize({
  Function group,
  Function setUp,
  Function testWidgets,
  String buttonText,
  Function buildButton,
  Type underlyingMaterialButtonType,
}) {
  group('font size', () {
    testWidgets('if fullWidth is false and narrow is true, the font size becomes smaller', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(buildButton(
        fullWidth: false,
        narrow: true,
      )));
      final button = findButtonStyleButton(underlyingMaterialButtonType);
      expect(button.style.textStyle.resolve(interactiveStates).fontSize, ButtonStyleConstants.smallFontSize);
    });
  });
}

void testFontStyle({
  Function group,
  Function setUp,
  Function testWidgets,
  String buttonText,
  TextStyle textStyle,
  Function buildButton,
  Type underlyingMaterialButtonType,
}) {
  group('font text style', () {
    testWidgets('text style is set', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(buildButton(textStyle: AppText.body2)));

      final button = findButtonStyleButton(underlyingMaterialButtonType);
      expect(button.style.textStyle.resolve(interactiveStates).fontSize, ButtonStyleConstants.smallFontSize);
    });
  });
}

void testPressingState({
  Function group,
  Function setUp,
  Function testWidgets,
  String buttonText,
  Function buildButton,
  Type underlyingMaterialButtonType,
}) {
  group('pressing state', () {
    testWidgets('when button is pressed it changes text color', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(buildButton(onPressed: () {})));
      expect(
        findForegroundColor(underlyingMaterialButtonType),
        AppColor.ltGreenPrimary,
        reason: 'Initial colors not match',
      );

      final gesture = await tester.createGesture();
      await gesture.down(tester.getCenter(find.text(buttonText)));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(
        findForegroundColor(underlyingMaterialButtonType),
        AppColor.darkerGreen,
        reason: 'Pressed color not match',
      );

      await gesture.up();
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(
        findForegroundColor(underlyingMaterialButtonType),
        AppColor.ltGreenPrimary,
        reason: 'Initial colors not returned',
      );
    });

    testWidgets('if button is disabled should have grey text regardless of tap events', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(buildButton(onPressed: null)));
      expect(
        findForegroundColor(underlyingMaterialButtonType),
        AppColor.ltGrayMedium,
        reason: 'Disabled color not match',
      );

      final gesture = await tester.createGesture();
      await gesture.down(tester.getCenter(find.text(buttonText)));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(
        findForegroundColor(underlyingMaterialButtonType),
        AppColor.ltGrayMedium,
        reason: 'Disabled preset color not match',
      );

      await gesture.up();
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(
        findForegroundColor(underlyingMaterialButtonType),
        AppColor.ltGrayMedium,
        reason: 'Disabled released color not match',
      );
    });
  });
}

Color findForegroundColor(Type underlyingMaterialButtonType) => findButtonStyleButton(underlyingMaterialButtonType).style.foregroundColor.resolve(interactiveStates);

ButtonStyleButton findButtonStyleButton(Type underlyingMaterialButtonType) => find.byType(underlyingMaterialButtonType).evaluate().single.widget;
