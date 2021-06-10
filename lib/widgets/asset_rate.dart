import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/widgets/odometer/odometer.dart';
import 'package:flutter_ui_kit/widgets/odometer/text_run.dart';
import 'package:intl/intl.dart' as intl;

import '../text.dart';
import '../text_styles.dart';

class AssetRate extends StatelessWidget {
  final String? symbol;
  final double? rate;
  final int decimalPlaces;

  const AssetRate(this.symbol, this.rate, {this.decimalPlaces = 2}) : assert(decimalPlaces > 0);

  @override
  Widget build(BuildContext context) {
    final formattedNumber = intl.NumberFormat('#,##0.${'0' * decimalPlaces}', 'en_US').format(rate);
    final value = formattedNumber.toString().substring(0, formattedNumber.indexOf('.'));
    final cents = formattedNumber.toString().substring(formattedNumber.indexOf('.'));
    return Column(
      children: <Widget>[
        RichText(
            text: TextSpan(children: [
          new TextSpan(text: '$symbol', style: TextStyles.style_40_60_regular),
          new TextSpan(text: '$value', style: TextStyles.style_40_60_regular),
          new TextSpan(text: '$cents', style: TextStyles.style_40_60_regular),
        ]))
      ],
    );
  }
}

// ignore: must_be_immutable
class AnimatedAssetRate extends StatelessWidget {
  final String symbol;
  final int decimalPlaces;
  final Stream<double> rateStream;
  final TextStyle largeTextStyle;
  final TextStyle smallTextStyle;

  AnimatedAssetRate(
    this.symbol,
    this.rateStream, {
    this.decimalPlaces = 2,
  })  : assert(decimalPlaces > 0),
        largeTextStyle = TextStyles.style_40_60_regular,
        smallTextStyle =
            AppText.body2.copyWith(height: (AppText.header0.fontSize! / AppText.body2.fontSize!).roundToDouble());

  String _lastFormattedRate = '0.00';

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<String>(
      stream: rateStream.map(_formatRate).distinct().where((r) => r != _lastFormattedRate),
      builder: (ctx, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
        debugPrint('RECEIVED RATE STREAM DATA: ${snapshot.data}');

        final prevVal = _lastFormattedRate;
        final curVal = snapshot.data!;

        final prevHundrethsPart = prevVal.substring(0, prevVal.indexOf('.'));
        final prevCentsPart = prevVal.substring(prevVal.indexOf('.') + 1);

        final curHundrethsPart = curVal.substring(0, curVal.indexOf('.'));
        final curCentsPart = curVal.substring(curVal.indexOf('.') + 1);
        _lastFormattedRate = curVal;
        return Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Odometer(
              [
                TextRun(symbol, symbol, largeTextStyle),
                TextRun(curHundrethsPart, prevHundrethsPart, largeTextStyle),
                TextRun('.', '.', largeTextStyle),
                TextRun(curCentsPart, prevCentsPart, largeTextStyle),
              ],
            ),
          ],
        );
      },
    );
  }

  String _formatRate(double rate) => intl.NumberFormat('#,##0.${'0' * decimalPlaces}', 'en_US').format(rate);
}
