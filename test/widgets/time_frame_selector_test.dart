import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/widgets/time_frame_selector.dart';

import '../wrap_in_material_app.dart';

void main() {
  group('TimeFrameSelector', () {
    testWidgets('renders time Frame selector', (WidgetTester tester) async {
      final key = GlobalKey();
      void onChangeTextField(String value) {
      }
      await tester.pumpWidget(wrapInMaterialApp(
          TimeFrameSelector(key: key, onChange: onChangeTextField)
      ));
      expect(find.byKey(key), findsOneWidget);
    });
  });
}
