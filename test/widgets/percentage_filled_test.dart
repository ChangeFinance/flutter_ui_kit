import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/widgets/percentage_filled.dart';
import 'package:flutter_test/flutter_test.dart';
import '../wrap_in_material_app.dart';


void main() {
  
  group('PercentageFilled', () {

    testWidgets('renders progress indicator bar on the screen', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(
        const PercentageFilled()
          ));
      expect(find.byType(PercentageFilled), findsOneWidget);
      });

    testWidgets('sets correct default properties', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(
        const PercentageFilled()
      ));
      final PercentageFilled progressIndicator = tester.element(find.byType(PercentageFilled)).widget;
      final SizedBox sizedBox = tester.element(find.byType(SizedBox)).widget;
      final LinearProgressIndicator linearProgressIndicator = tester.element(find.byType(LinearProgressIndicator)).widget;
      final ClipRRect clipRRect = tester.element(find.byType(ClipRRect)).widget;
      expect(sizedBox.height, 6.0);
      expect(clipRRect.borderRadius, BorderRadius.circular(0.0));
      expect(linearProgressIndicator.value, 0.4);
      expect(linearProgressIndicator.valueColor.value, const AlwaysStoppedAnimation<Color>(Colors.greenAccent).value);
      expect(linearProgressIndicator.backgroundColor, Colors.white);
      expect(progressIndicator.progressIndicatorValue, 40.0);
      expect(progressIndicator.roundedBorder, 0.0);
      expect(progressIndicator.height, 6.0);
      expect(progressIndicator.background, false);
      expect(progressIndicator.color, Colors.greenAccent);
    });

    testWidgets('passes correct properties', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(
        const PercentageFilled(
          progressIndicatorValue: 90.0,
          roundedBorder: 10.0,
          height: 10.0,
          background: true,
          color: Colors.blue,
        )
      ));
      final PercentageFilled progressIndicator = tester.element(find.byType(PercentageFilled)).widget;
      final SizedBox sizedBox = tester.element(find.byType(SizedBox)).widget;
      final LinearProgressIndicator linearProgressIndicator = tester.element(find.byType(LinearProgressIndicator)).widget;
      final ClipRRect clipRRect = tester.element(find.byType(ClipRRect)).widget;
      expect(sizedBox.height, 10.0);
      expect(clipRRect.borderRadius, BorderRadius.circular(10.0));
      expect(linearProgressIndicator.value, 0.9);
      expect(linearProgressIndicator.valueColor.value, const AlwaysStoppedAnimation<Color>(Colors.blue).value);
      expect(linearProgressIndicator.backgroundColor, Colors.grey[200]);
      expect(progressIndicator.progressIndicatorValue, 90.0);
      expect(progressIndicator.roundedBorder, 10.0);
      expect(progressIndicator.height, 10.0);
      expect(progressIndicator.background, true);
      expect(progressIndicator.color, Colors.blue);
    });
  });
}