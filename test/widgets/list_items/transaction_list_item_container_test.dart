import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/widgets/list_items/transaction_list_item.dart';
import 'package:flutter_ui_kit/widgets/list_items/transaction_list_item_container.dart';

import '../../wrap_in_material_app.dart';

void main() {
  group('Transaction List Item Container', () {
    testWidgets('renders Transaction List Item Container',
        (WidgetTester tester) async {
      const transactionList = <Widget>[
        const TransactionListItem(
            onPressed: null,
            transactionIcon: Icon(Icons.arrow_back),
            title: 'Bought Bitcoin',
            subTitle: '14 Jan',
            amount: '+ 0.04 BTC',
            amountDecoration: AmountDecoration.BADGE),
        const TransactionListItem(
            onPressed: null,
            transactionIcon: Icon(Icons.arrow_back),
            title: 'Sold Bitcoin',
            subTitle: '14 Jan',
            amount: '- 0.04 BTC',
            amountDecoration: AmountDecoration.BADGE)
      ];

      await tester.pumpWidget(wrapInMaterialApp(
          const TransactionListItemContainer(
              title: 'Today', transactionListItems: transactionList)));

      expect(find.text('Today'), findsOneWidget);
      expect(find.text('Bought Bitcoin'), findsOneWidget);
      expect(find.text('Sold Bitcoin'), findsOneWidget);
      expect(find.text('+ 0.04 BTC'), findsOneWidget);
      expect(find.text('- 0.04 BTC'), findsOneWidget);
    });
  });
}
