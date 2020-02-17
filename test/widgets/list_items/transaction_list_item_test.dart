import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/widgets/list_items/transaction_list_item.dart';

import '../../wrap_in_material_app.dart';

void main() {
  group('Transaction List Item', () {
    testWidgets('renders transaction list item with one amount', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(
          const TransactionListItem(
              onPressed: null,
              transactionIcon: Icon(Icons.arrow_back),
              title: 'Bought Bitcoin',
              subTitle: '14 Jan',
              amount: '+ 0.04 BTC',
              amountDecoration: AmountDecoration.BADGE
          )
      ));

      expect(find.text('Bought Bitcoin'), findsOneWidget);
      expect(find.text('+ 0.04 BTC'), findsOneWidget);
      final widget = tester.widget(find.byType(Container).at(2));
      final Container containerWidget = widget;
      final BoxDecoration decoration = containerWidget.decoration;
      expect(decoration.color, AppColor.greenLight);
      expect(decoration.borderRadius, const BorderRadius.all(Radius.circular(8.0)));
    });

    testWidgets('renders transaction list item with two amounts', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(
          const TransactionListItem(
            onPressed: null,
            transactionIcon: Icon(Icons.arrow_back),
            title: 'Bought Bitcoin',
            subTitle: '14 Jan',
            amount: '+ 0.04 BTC',
            amountDecoration: AmountDecoration.NO,
            secondAmount: '€122.84',
            secondAmountDecoration: AmountDecoration.CROSS_OUT,
          )
      )
      );

      expect(find.text('Bought Bitcoin'), findsOneWidget);
      expect(find.text('+ 0.04 BTC'), findsOneWidget);
      expect(find.text('€122.84'), findsOneWidget);
      final widget = tester.widget(find.byType(Text).at(3));
      final Text textWidget = widget;
      final decoration = textWidget.style.decoration;
      expect(decoration, TextDecoration.lineThrough);
    });

    testWidgets('renders transaction list item with divider', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(
          const TransactionListItem(
            onPressed: null,
            transactionIcon: Icon(Icons.arrow_back),
            title: 'Bought Bitcoin',
            subTitle: '14 Jan',
            amount: '+ 0.04 BTC',
            amountDecoration: AmountDecoration.BADGE,
            withDivider: true,
          )
      ));

      expect(find.text('Bought Bitcoin'), findsOneWidget);
      expect(find.text('+ 0.04 BTC'), findsOneWidget);
      final widget = tester.widget(find.byType(Container).at(0));
      final Container containerWidget = widget;
      final BoxDecoration decoration = containerWidget.decoration;
      expect(decoration.border.bottom.color, AppColor.lightestGrey);
    });
  });
}
