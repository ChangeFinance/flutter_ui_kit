import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/widgets/asset_rate.dart';
import '../wrap_in_material_app.dart';

void main() {
  group('AssetRate', () {
    testWidgets('renders rate value', (WidgetTester tester) async {
      const symbol = '€';
      const rate = 8750.1;
      await tester.pumpWidget(wrapInMaterialApp(const AssetRate(symbol, rate)));
      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(Text).evaluate().length, 3);
      expect(find.text('€ '), findsOneWidget);
      expect(find.text('8,750'), findsOneWidget);
      expect(find.text('.10'), findsOneWidget);
    });
  });
}
