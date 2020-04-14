import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/widgets/odometer/odometer.dart';
import 'package:flutter_ui_kit/widgets/odometer/text_run.dart';
import 'package:intl/intl.dart' as intl;

import '../text.dart';

class AssetRate extends StatelessWidget {
  final String symbol;
  final double rate;
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
          new TextSpan(text: '$symbol ', style: AppText.body2),
          new TextSpan(text: '$value', style: AppText.header0.copyWith(fontWeight: FontWeight.bold)),
          new TextSpan(text: '$cents', style: AppText.body2),
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
        largeTextStyle = AppText.header0.copyWith(fontWeight: FontWeight.bold),
        smallTextStyle =
            AppText.body2.copyWith(height: (AppText.header0.fontSize / AppText.body2.fontSize).roundToDouble()){
    rateStream.listen((r) {});
  }

  String _lastFormattedRate = '0.00';

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = this.smallTextStyle.copyWith(height: 3.5);

    return StreamBuilder<String>(
      stream: rateStream?.map(_formatRate)?.distinct()?.where((r) => r != _lastFormattedRate),
      builder: (ctx, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
        debugPrint('RECEIVED RATE STREAM DATA: ${snapshot.data}');

        final prevVal = _lastFormattedRate;
        final curVal = snapshot.data;

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
                TextRun(symbol, symbol, smallTextStyle),
                TextRun(curHundrethsPart, prevHundrethsPart, largeTextStyle),
                TextRun('.', '.', smallTextStyle),
                TextRun(curCentsPart, prevCentsPart, smallTextStyle),
              ],
            ),
          ],
        );
      },
    );
  }

  String _formatRate(double rate) => intl.NumberFormat('#,##0.${'0' * decimalPlaces}', 'en_US').format(rate);
}
