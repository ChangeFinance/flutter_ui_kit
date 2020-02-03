import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/widgets/filled_button.dart';
import 'package:flutter_ui_kit/widgets/text_button.dart';
import 'package:flutter_ui_kit/widgets/time_frame_selector.dart';

import '../wrap_in_material_app.dart';

void main() {
  group('TimeFrameSelector', () {
    testWidgets('renders time Frame selector', (WidgetTester tester) async {
      void onChangeTextField(String value) {
      }
      await tester.pumpWidget(wrapInMaterialApp(
          TimeFrameSelector(onChange: onChangeTextField)
      ));
      expect(find.byType(TimeFrameSelector), findsOneWidget);
    });
    testWidgets('click on button', (WidgetTester tester) async {
      void onChangeTextField(String value) {
      }
      await tester.pumpWidget(wrapInMaterialApp(
          TimeFrameSelector(onChange: onChangeTextField)
      ));
      expect(find.byType(TextButton).evaluate().length, 4);
      expect(find.byType(FilledButton).evaluate().length, 1);
      final initFilledButton = tester.widget(find.byType(FilledButton));
      final FilledButton initContainerWidget = initFilledButton;
      expect(initContainerWidget.text, '1D');
      await tester.tap(find.text('1Y'));
      await tester.pump();
      expect(find.byType(TextButton).evaluate().length, 4);
      expect(find.byType(FilledButton).evaluate().length, 1);
      final widget = tester.widget(find.byType(FilledButton));
      final FilledButton containerWidget = widget;
      expect(containerWidget.text, '1Y');
    });

    testWidgets('can access period selected from external object', (WidgetTester tester) async {
      final timeFrameSelectorKey = new GlobalKey<TimeFrameSelectorWidgetState>();
      void onChangeTextField(String value) {
      }

      await tester.pumpWidget(wrapInMaterialApp(
          TimeFrameSelector(key: timeFrameSelectorKey, onChange: onChangeTextField)
      ));
      expect(find.byType(TimeFrameSelector), findsOneWidget);
      expect(find.byType(TextButton).evaluate().length, 4);
      expect(find.byType(FilledButton).evaluate().length, 1);
      await tester.tap(find.text('1Y'));
      await tester.pump();

      expect(timeFrameSelectorKey.currentState.periodValue, '1Y');

    });

    testWidgets('can show 5 years option', (WidgetTester tester) async {
      void onChangeTextField(String value) {
      }
      await tester.pumpWidget(wrapInMaterialApp(
          TimeFrameSelector(maxTimeFrame: '5Y', onChange: onChangeTextField)
      ));
      expect(find.byType(TimeFrameSelector), findsOneWidget);
      expect(find.byType(TextButton).evaluate().length, 5);
      expect(find.text('1D'), findsOneWidget);
      expect(find.text('1W'), findsOneWidget);
      expect(find.text('1M'), findsOneWidget);
      expect(find.text('1Y'), findsOneWidget);
      expect(find.text('5Y'), findsOneWidget);
    });

    testWidgets('can hide 5 years option', (WidgetTester tester) async {
      void onChangeTextField(String value) {
      }
      await tester.pumpWidget(wrapInMaterialApp(
          TimeFrameSelector(maxTimeFrame: '1Y', onChange: onChangeTextField)
      ));
      expect(find.byType(TimeFrameSelector), findsOneWidget);
      expect(find.text('1Y'), findsOneWidget);
      expect(find.text('5Y'), findsNothing);
    });

    testWidgets(
        'can hide 1 year and 5 years options', (WidgetTester tester) async {
      void onChangeTextField(String value) {
      }
      await tester.pumpWidget(wrapInMaterialApp(
          TimeFrameSelector(maxTimeFrame: '1M', onChange: onChangeTextField)
      ));
      expect(find.byType(TimeFrameSelector), findsOneWidget);
      expect(find.text('1M'), findsOneWidget);
      expect(find.text('1Y'), findsNothing);
      expect(find.text('5Y'), findsNothing);
    });

  });
}
