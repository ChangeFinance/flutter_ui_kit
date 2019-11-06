import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/widgets/text/pin_view.dart';

import '../../wrap_in_material_app.dart';

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
      final pinDots = pindotsFinder.evaluate().map<PinDot>((e) => e.widget).toList();
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
}
