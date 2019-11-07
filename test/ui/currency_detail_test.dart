import 'package:changeapp_common/model/currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/theme.dart';
import 'package:flutter_ui_kit/ui/currency_detail.dart';
import 'package:flutter_ui_kit/ui/currency_icon.dart';

void main() {
  MaterialApp wrapInMaterialApp(Widget widget) {
    return MaterialApp(
      theme: theme,
      home: Scaffold(body: widget),
    );
  }

  group('Currency Detail', () {
    testWidgets('renders icon and text', (tester) async {
      await tester.pumpWidget(
        wrapInMaterialApp(
          Directionality(
          textDirection: TextDirection.ltr,
          child: CurrencyDetail(new Currency('ETH')),
        ),
      ));
      expect(find.byType(CurrencyIcon), findsOneWidget);
      expect(find.text('ETH'), findsOneWidget);
      expect(find.text('Ethereum'), findsOneWidget);
    });

    testWidgets('throws an exception if currency code is null', (tester) async {
      expect(() async {
        await tester.pumpWidget(
          wrapInMaterialApp(
              Directionality(
                textDirection: TextDirection.ltr,
                child: CurrencyDetail(new Currency('OTHER')),
              )
          )
        );
      }, throwsAssertionError);
    });
  });
}
