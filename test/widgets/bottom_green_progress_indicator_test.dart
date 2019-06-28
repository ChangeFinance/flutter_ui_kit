import 'package:flutter_ui_kit/widgets/bottom_green_progress_indicator.dart';
import 'package:flutter_test/flutter_test.dart';
import '../wrap_in_material_app.dart';

void main() {
  
  group('BottomGreenProgressIndicator', () {

    testWidgets('renders progress indicator bar on the screen', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(
        const BottomGreenProgressIndicator()
          )
        );
      expect(find.byType(BottomGreenProgressIndicator), findsOneWidget);
      } 
    );

    testWidgets('sets correct default properties', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(
        const BottomGreenProgressIndicator()
      ));
      final BottomGreenProgressIndicator progressIndicator = tester.element(find.byType(BottomGreenProgressIndicator)).widget;
      expect(progressIndicator.progressIndicatorValue, 4.0);
      expect(progressIndicator.roundedBorder, 0.0);
    });

    testWidgets('passes correct properties', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(
        const BottomGreenProgressIndicator(
          progressIndicatorValue: 9.0,
          roundedBorder: 10.0,
        )
      ));
      final BottomGreenProgressIndicator progressIndicator = tester.element(find.byType(BottomGreenProgressIndicator)).widget;
      expect(progressIndicator.progressIndicatorValue, 9.0);
      expect(progressIndicator.roundedBorder, 10.0);
    });
  });
}