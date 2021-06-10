import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/widgets/pin_view.dart';

import '../wrap_in_material_app.dart';

void main() {
  group('Pin view', () {
    testWidgets('renders correct number of pinview dots', (WidgetTester tester) async {
      final pinView = PinView(4, '');
      final widget = wrapInMaterialApp(pinView);
      await tester.pumpWidget(widget);
      await tester.pump();

      expect(find.byType(PinView), findsOneWidget);
      expect(find.byType(PinDot), findsNWidgets(4));
    });

    testWidgets('renders correct number of dark pinview dots', (WidgetTester tester) async {
      final pinView = PinView(4, 'he');
      final widget = wrapInMaterialApp(pinView);
      await tester.pumpWidget(widget);
      await tester.pump();

      expect(find.byType(PinView), findsOneWidget);
      final pindotsFinder = find.byType(PinDot);
      final pinDots = pindotsFinder.evaluate().map<PinDot>((e) => e.widget as PinDot).toList();
      final activeDots = pinDots.where((pinDot) => pinDot.active).toList();
      final inactiveDots = pinDots.where((pinDot) => !pinDot.active).toList();

      expect(activeDots.length, 2);
      expect(inactiveDots.length, 2);
      expect(pinDots.first.active, true);
      expect(pinDots[1].active, true);
      expect(pinDots[2].active, false);
      expect(pinDots[3].active, false);
    });
  });


  group('PinText view', () {
    testWidgets('renders correct number of placeholders in text mode', (WidgetTester tester) async {
      final pinView = PinView(4, '432', displayText: true);
      final widget = wrapInMaterialApp(pinView);
      await tester.pumpWidget(widget);
      await tester.pump();

      expect(find.byType(PinView), findsOneWidget);
      expect(find.byType(PinText), findsNWidgets(4));
    });

    testWidgets('renders entered numbers in text mode', (WidgetTester tester) async {
      final pinView = PinView(4, '432', displayText: true);
      final widget = wrapInMaterialApp(pinView);
      await tester.pumpWidget(widget);
      await tester.pump();

      expect(find.byType(PinView), findsOneWidget);
      expect(find.byType(PinText), findsNWidgets(4));
      expect(find.widgetWithText(PinText, '4'), findsOneWidget);
      expect(find.widgetWithText(PinText, '3'), findsOneWidget);
      expect(find.widgetWithText(PinText, '4'), findsOneWidget);
    });
  });
}
