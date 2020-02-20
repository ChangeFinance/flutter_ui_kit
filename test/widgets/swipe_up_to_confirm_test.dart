import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/widgets/layout/swipe_up_to_confirm.dart';

import '../wrap_in_material_app.dart';

void main() {
  group('swipe up to confirm view', () {
    group('swipe up to confirm view with enabled swipe mode', () {
      MaterialApp widget;

      setUp(() {
        final swipeUpView = SwipeUpToConfirmLayout(
          body: Center(
            child: const Text('Hello'),
          ),
          swiperDisplay: const Text('Swiper display'),
          completeScreenLabelIcon: const Text('Label icon'),
          completeScreenLabelText: 'Label text',
          completeScreenLabelTitle: 'Label title',
        );
        widget = wrapInMaterialApp(swipeUpView);
      });

      testWidgets('renders layout', (WidgetTester tester) async {
        await tester.pumpWidget(widget);
        await tester.pumpAndSettle();

        expect(find.byType(SwipeUpToConfirmLayout), findsOneWidget);
        expect(find.text('Hello'), findsOneWidget);
        expect(find.text('Swiper display'), findsOneWidget);
        expect(find.text('Label icon'), findsNothing);
        expect(find.text('Label text'), findsNothing);
        expect(find.text('Label title'), findsNothing);
      });

      testWidgets('renders layout after swipe', (WidgetTester tester) async {
        await tester.pumpWidget(widget);
        await tester.pumpAndSettle();

        expect(find.byType(SwipeUpToConfirmLayout), findsOneWidget);
        expect(find.text('Hello'), findsOneWidget);
        expect(find.text('Swiper display'), findsOneWidget);
        expect(find.text('Label icon'), findsNothing);
        expect(find.text('Label text'), findsNothing);
        expect(find.text('Label title'), findsNothing);

        await swipeUp(tester, find.text('Swiper display'));
        expect(find.text('Label icon'), findsOneWidget);
        expect(find.text('Label text'), findsOneWidget);
        expect(find.text('Label title'), findsOneWidget);
      });
    });

    group('swipe up to confirm view with disabled swipe mode', () {
      MaterialApp widget;
      Function swipeUpCompleteAction;

      setUp(() {
        swipeUpCompleteAction = () {};

        final swipeUpView = SwipeUpToConfirmLayout(
          body: Center(
            child: const Text('Hello'),
          ),
          swiperDisplay: const Text('Swiper display'),
          swipeCompleteCallback: swipeUpCompleteAction,
          completeScreenLabelIcon: const Text('Label icon'),
          completeScreenLabelText: 'Label text',
          completeScreenLabelTitle: 'Label title',
          swipeMode: SwipeMode.static,
        );
        widget = wrapInMaterialApp(swipeUpView);
      });

      testWidgets('disabled swipe mode', (WidgetTester tester) async {
        await tester.pumpWidget(widget);
        await tester.pumpAndSettle();

        expect(find.byType(SwipeUpToConfirmLayout), findsOneWidget);
        expect(find.text('Hello'), findsOneWidget);
        expect(find.text('Swiper display'), findsOneWidget);
        expect(find.text('Label icon'), findsNothing);
        expect(find.text('Label text'), findsNothing);
        expect(find.text('Label title'), findsNothing);

        await swipeUp(tester, find.text('Swiper display'));
        expect(find.text('Label icon'), findsNothing);
        expect(find.text('Label text'), findsNothing);
        expect(find.text('Label title'), findsNothing);
      });
    });
  });
}

Future swipeUp(WidgetTester tester, Finder finder) async {
  final offset = tester.getCenter(finder);
  final gesture = await tester.startGesture(offset);
  await gesture.moveBy(const Offset(0, -500));
  await gesture.up();
  await tester.pumpAndSettle(const Duration(seconds: 1, milliseconds: 500));
}
