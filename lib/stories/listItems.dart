import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/story_book/expandable_story.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/bool_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/dropdown_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/string_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/props_explorer.dart';
import 'package:flutter_ui_kit/widgets/list_items/transaction_list_item.dart';

const _primaryAmountDecorationList = ['NO', 'BADGE', 'CROSS_OUT'];
const _secondaryAmountDecorationList = ['NO', 'CROSS_OUT'];

AmountDecoration _optionToAmountDecoration(String optionSelected) {
  switch (optionSelected) {
    case 'NO':
      return AmountDecoration.NO;
    case 'BADGE':
      return AmountDecoration.BADGE;
    default:
      return AmountDecoration.CROSS_OUT;
  }
}

class ListItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _transactionListItem(context)
        ],
      ),
    );
  }

  Widget _transactionListItem(BuildContext context) {
    return ExpandableStory(
      title: 'Transaction List Item',
      child: PropsExplorer(
        initialProps: const <String, dynamic>{
          'title': 'Bought Bitcoin',
          'subTitle': '14 Jan',
          'amount': '+ 0.04 BTC',
          'secondAmount': '€122.84',
          'amountDecoration': 'BADGE',
          'secondAmountDecoration': 'CROSS_OUT',
          'withDivider': true
        },
        formBuilder: (context, props, updateProp) {
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              StringPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'title',
              ),
              StringPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'subTitle',
              ),
              StringPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'amount',
              ),
              StringPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'secondAmount',
              ),
              DropdownPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'amountDecoration',
                options: _primaryAmountDecorationList,
              ),
              DropdownPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'secondAmountDecoration',
                options: _secondaryAmountDecorationList,
              ),
              BoolPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'withDivider',
              ),
            ],
          );
        },
          widgetBuilder: (context, props) {
            return Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                      child: TransactionListItem(
                        onPressed: null,
                        transactionIcon: const Icon(Icons.arrow_back),
                        amount: props['amount'],
                        amountDecoration: _optionToAmountDecoration(props['amountDecoration']),
                        secondAmount: props['secondAmount'],
                        secondAmountDecoration: _optionToAmountDecoration(props['secondAmountDecoration']),
                        withDivider: props['withDivider'],
                        title: props['title'],
                        subTitle: props['subTitle'],
                      )
              ),
            ]);
          }));
  }
}
