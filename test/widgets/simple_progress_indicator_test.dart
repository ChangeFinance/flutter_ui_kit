import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/widgets/simple_progress_indicator.dart';
import 'package:flutter_test/flutter_test.dart';
import '../wrap_in_material_app.dart';


void main() {
  
  group('SimpleProgressIndicator', () {

    testWidgets('renders progress indicator bar on the screen', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(
        const SimpleProgressIndicator()
          ));
      expect(find.byType(SimpleProgressIndicator), findsOneWidget);
      });

    testWidgets('sets correct default properties', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(
        const SimpleProgressIndicator()
      ));
      final SimpleProgressIndicator progressIndicator = tester.element(find.byType(SimpleProgressIndicator)).widget;
      expect(progressIndicator.progressIndicatorValue, 40.0);
      expect(progressIndicator.roundedBorder, 0.0);
      expect(progressIndicator.height, 6.0);
      expect(progressIndicator.background, false);
      expect(progressIndicator.color, Colors.greenAccent);
    });

    testWidgets('passes correct properties', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(
        const SimpleProgressIndicator(
          progressIndicatorValue: 9.0,
          roundedBorder: 10.0,
          height: 10.0,
          background: true,
          color: Colors.greenAccent,
        )
      ));
      final SimpleProgressIndicator progressIndicator = tester.element(find.byType(SimpleProgressIndicator)).widget;
      expect(progressIndicator.progressIndicatorValue, 9.0);
      expect(progressIndicator.roundedBorder, 10.0);
      expect(progressIndicator.height, 10.0);
      expect(progressIndicator.background, true);
      expect(progressIndicator.color, Colors.greenAccent);
    });
  });
}