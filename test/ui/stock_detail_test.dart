import 'package:changeapp_common/model/stock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/ui/stock_detail.dart';
import 'package:flutter_ui_kit/ui/stock_icon.dart';

void main() {
  group('Stock Detail', () {
    testWidgets('renders icon and text', (tester) async {
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: StockDetail(new Stock('BUNDLE')),
        ),
      );
      expect(find.byType(ColourfulStockIcon), findsOneWidget);
      expect(find.text('US tech stocks'), findsOneWidget);
      expect(find.text('Amazon, Netflix, and more'), findsOneWidget);
    });

    testWidgets('throws an exception if stock code is null', (tester) async {
      expect(() async {
        await tester.pumpWidget(
          Directionality(
            textDirection: TextDirection.ltr,
            child: StockDetail(new Stock('OTHER')),
          ),
        );
      }, throwsAssertionError);
    });
  });
}