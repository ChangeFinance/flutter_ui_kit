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
      final progressIndicator = tester.element(find.byType(SimpleProgressIndicator)).widget as SimpleProgressIndicator;
      final sizedBox = tester.element(find.byType(SizedBox)).widget as SizedBox;
      final linearProgressIndicator = tester.element(find.byType(LinearProgressIndicator)).widget as LinearProgressIndicator;
      final clipRRect = tester.element(find.byType(ClipRRect)).widget as ClipRRect;
      expect(sizedBox.height, 6.0);
      expect(clipRRect.borderRadius, BorderRadius.circular(0.0));
      expect(linearProgressIndicator.value, 0.4);
      expect(linearProgressIndicator.valueColor!.value, const AlwaysStoppedAnimation<Color>(Colors.greenAccent).value);
      expect(linearProgressIndicator.backgroundColor, Colors.white);
      expect(progressIndicator.percentageFilled, 40.0);
      expect(progressIndicator.roundedBorder, 0.0);
      expect(progressIndicator.height, 6.0);
      expect(progressIndicator.background, false);
      expect(progressIndicator.color, Colors.greenAccent);
    });

    testWidgets('passes correct properties', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(
        const SimpleProgressIndicator(
          percentageFilled: 90.0,
          roundedBorder: 10.0,
          height: 10.0,
          background: true,
          color: Colors.blue,
        )
      ));
      final progressIndicator = tester.element(find.byType(SimpleProgressIndicator)).widget as SimpleProgressIndicator;
      final sizedBox = tester.element(find.byType(SizedBox)).widget as SizedBox;
      final linearProgressIndicator = tester.element(find.byType(LinearProgressIndicator)).widget as LinearProgressIndicator;
      final clipRRect = tester.element(find.byType(ClipRRect)).widget as ClipRRect;
      expect(sizedBox.height, 10.0);
      expect(clipRRect.borderRadius, BorderRadius.circular(10.0));
      expect(linearProgressIndicator.value, 0.9);
      expect(linearProgressIndicator.valueColor!.value, const AlwaysStoppedAnimation<Color>(Colors.blue).value);
      expect(linearProgressIndicator.backgroundColor, Colors.grey[200]);
      expect(progressIndicator.percentageFilled, 90.0);
      expect(progressIndicator.roundedBorder, 10.0);
      expect(progressIndicator.height, 10.0);
      expect(progressIndicator.background, true);
      expect(progressIndicator.color, Colors.blue);
    });
  });
}