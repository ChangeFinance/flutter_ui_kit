import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/widgets/asset_rate.dart';
import '../wrap_in_material_app.dart';

void main() {
  group('AssetRate', () {
    testWidgets('renders value', (WidgetTester tester) async {
      const symbol = '€';
      const rate = 8750.1;
      await tester.pumpWidget(wrapInMaterialApp(const AssetRate(symbol, rate)));
      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(RichText), findsOneWidget);
      final richText = find.byType(RichText).evaluate().first.widget as RichText;
      final richTextText = richText.text.toPlainText();
      expect(richTextText, '€8,750.10');
    });

    testWidgets('renders negative value', (WidgetTester tester) async {
      const symbol = '€';
      const rate = -8701.478;
      await tester.pumpWidget(wrapInMaterialApp(const AssetRate(symbol, rate)));
      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(RichText), findsOneWidget);
      final richText = find.byType(RichText).evaluate().first.widget as RichText;
      final richTextText = richText.text.toPlainText();
      expect(richTextText, '€-8,701.48');
    });
  });
}
