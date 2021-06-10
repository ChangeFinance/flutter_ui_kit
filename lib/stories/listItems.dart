import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/story_book/expandable_story.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/bool_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/dropdown_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/string_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/props_explorer.dart';
import 'package:flutter_ui_kit/ui/svg_icon.dart';
import 'package:flutter_ui_kit/widgets/list_items/information_list_item.dart';
import 'package:flutter_ui_kit/widgets/list_items/transaction_list_item.dart';
import 'package:flutter_ui_kit/widgets/list_items/transaction_list_item_container.dart';

const _primaryAmountDecorationList = ['NO', 'BADGE', 'CROSS_OUT'];
const _secondaryAmountDecorationList = ['NO', 'CROSS_OUT'];

AmountDecoration _optionToAmountDecoration(String? optionSelected) {
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
          _transactionListItem(context),
          _informationListItem(context),
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
                    child: TransactionListItemContainer(title: 'Today', transactionListItems: [
                  TransactionListItem(
                    onPressed: null,
                    transactionIcon: const Icon(Icons.arrow_back),
                    amount: props['amount'],
                    amountDecoration: _optionToAmountDecoration(props['amountDecoration']),
                    secondAmount: props['secondAmount'],
                    secondAmountDecoration: _optionToAmountDecoration(props['secondAmountDecoration']),
                    withDivider: props['withDivider'],
                    title: props['title'],
                    subTitle: props['subTitle'],
                  ),
                  TransactionListItem(
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
                ])),
              ]);
            }));
  }

  Widget _informationListItem(BuildContext context) {
    return ExpandableStory(
      title: 'Information List Item',
      child: PropsExplorer(
        initialProps: const <String, dynamic>{
          'title': 'Flexible spending',
          'information': 'Use your Change card worldwide, wherever Visa is accepted',
          'linkText': 'See card fees',
          'badgeText': '',
        },
        formBuilder: (ctx, props, updateProp) {
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              StringPropUpdater(props: props, updateProp: updateProp, propKey: 'title'),
              StringPropUpdater(props: props, updateProp: updateProp, propKey: 'information'),
              StringPropUpdater(props: props, updateProp: updateProp, propKey: 'linkText'),
              StringPropUpdater(props: props, updateProp: updateProp, propKey: 'badgeText'),
            ],
          );
        },
        widgetBuilder: (ctx, props) {
          final String? title = props['title'];
          final String? information = props['information'];
          final String? linkText = props['linkText'];
          final String? badgeText = props['badgeText'];

          return Container(
            width: double.infinity,
            child: InformationListItem(
              linkText,
              badgeText,
              icon: const SvgIcon(
                path: 'assets/card_holder.svg',
                color: SvgIconColor.noColor,
              ),
              title: title,
              information: information,
              linkAction: () {
                showDialog<dynamic>(
                    context: ctx,
                    builder: (c) {
                      return AlertDialog(
                        title: const Text('Link pressed'),
                        content: const Text('Link pressed'),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () => Navigator.of(c).pop(),
                            child: const Text('Close'),
                          ),
                        ],
                      );
                    });
              },
            ),
          );
        },
      ),
    );
  }
}
