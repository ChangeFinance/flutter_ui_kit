import 'package:flutter/material.dart';
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
      final key = GlobalKey();
      void onChangeTextField(String value) {
      }
      await tester.pumpWidget(wrapInMaterialApp(
          TimeFrameSelector(key: key, onChange: onChangeTextField)
      ));
      expect(find.byType(TextButton).evaluate().length, 5);
      expect(find.byType(FilledButton).evaluate().length, 1);
      await tester.tap(find.text('1Y'));
      expect(find.byType(TextButton).evaluate().length, 5);
      expect(find.byType(FilledButton).evaluate().length, 1);
    });

  });
}
