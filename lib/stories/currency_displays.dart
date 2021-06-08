import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/story_book/expandable_story.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/bool_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/double_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/string_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/props_explorer.dart';
import 'package:flutter_ui_kit/widgets/asset_rate.dart';
import 'package:flutter_ui_kit/widgets/currency_display.dart';
import 'package:flutter_ui_kit/widgets/currency_switcher.dart';
import 'package:rxdart/rxdart.dart';

class CurrencyDisplays extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _currencyDisplayStory(),
            _currencySwitcherStory(),
            _assetRateStory(),
            _AnimatedAssetRateStory(),
          ],
        ),
      ),
    );
  }

  Widget _currencyDisplayStory() {
    return ExpandableStory(
      title: 'Currency Display',
      child: PropsExplorer(
        initialProps: const <String, dynamic>{
          'currencySymbol': '₿',
          'amount': 100000.0,
          'amountIsNull': false,
          'isLarge': true,
          'showCursor': true
        },
        formBuilder: (context, props, updateProp) {
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              StringPropUpdater(props: props, updateProp: updateProp, propKey: 'currencySymbol'),
              BoolPropUpdater(props: props, updateProp: updateProp, propKey: 'amountIsNull'),
              BoolPropUpdater(props: props, updateProp: updateProp, propKey: 'isLarge'),
              BoolPropUpdater(props: props, updateProp: updateProp, propKey: 'showCursor'),
              DoublePropUpdater(props: props, updateProp: updateProp, propKey: 'amount', min: 0, max: 999999999),
            ],
          );
        },
        widgetBuilder: (context, props) {
          double? amount = props['amount'];
          final String? symbol = props['currencySymbol'];
          final bool amountIsNull = props['amountIsNull'];
          final bool isLarge = props['isLarge'];
          final bool? showCursor = props['showCursor'];
          if (amountIsNull) {
            amount = null;
          }
          return CurrencyDisplay(
              amount: '$amount',
              currencySymbol: symbol,
              size: isLarge ? CurrencyDisplaySize.large : CurrencyDisplaySize.small,
              showCursor: showCursor);
        },
      ),
    );
  }

  Widget _currencySwitcherStory() {
    return ExpandableStory(
      title: 'Currency Switcher',
      child: PropsExplorer(
        initialProps: const <String, dynamic>{'selectedCurrencyAmount': true},
        formBuilder: (context, props, updateProp) {
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              BoolPropUpdater(props: props, updateProp: updateProp, propKey: 'selectedCurrencyAmount'),
            ],
          );
        },
        widgetBuilder: (context, props) {
          final bool? oneAmount = props['selectedCurrencyAmount'];
          return CurrencySwitcher(
            onlySwitchedAmount: oneAmount,
            amounts: const ['2012', '0.0045'],
            currencyInfoList: [
              CurrencyInfo(label: 'USD', symbol: '\$', prefix: true),
              CurrencyInfo(label: 'BTC', symbol: 'BTC')
            ],
          );
        },
      ),
    );
  }

  Widget _assetRateStory() {
    return ExpandableStory(
      title: 'Asset Rate',
      child: PropsExplorer(
        initialProps: const <String, dynamic>{'currencySymbol': '€', 'amount': 1792.28},
        formBuilder: (context, props, updateProp) {
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              StringPropUpdater(props: props, updateProp: updateProp, propKey: 'currencySymbol'),
              DoublePropUpdater(props: props, updateProp: updateProp, propKey: 'amount', min: 0, max: 999999999),
            ],
          );
        },
        widgetBuilder: (context, props) {
          final double? amount = props['amount'];
          final String? symbol = props['currencySymbol'];
          return AssetRate(symbol, amount);
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class _AnimatedAssetRateStory extends StatefulWidget {
  @override
  __AnimatedAssetRateStoryState createState() => __AnimatedAssetRateStoryState();
}

class __AnimatedAssetRateStoryState extends State<_AnimatedAssetRateStory> {
  static double _currRate = 0.01;
  BehaviorSubject<double> rateStream = BehaviorSubject.seeded(_currRate);

  @override
  void initState() {
    super.initState();
    rateStream.listen((r) {
      _currRate = r;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableStory(
      title: 'Animated Asset Rate',
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AnimatedAssetRate('€', rateStream),
          const SizedBox(height: 20),
          RaisedButton(
            child: const Text('Refresh Price', style: const TextStyle(color: Colors.white)),
            onPressed: () {
              rateStream.add(_currRate * 1.5);
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    rateStream?.close();
  }
}
