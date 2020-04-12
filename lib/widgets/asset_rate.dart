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

class AnimatedAssetRate extends StatefulWidget {
  final String symbol;
  final int decimalPlaces;
  final Stream<double> rateStream;

  const AnimatedAssetRate(this.symbol, this.rateStream, {this.decimalPlaces = 2}) : assert(decimalPlaces > 0);

  @override
  _AnimatedAssetRateState createState() => _AnimatedAssetRateState();
}

class _AnimatedAssetRateState extends State<AnimatedAssetRate> {
  double _initialRate = 0.0;
  double _currentRate = 0.0;

  Stream<double> get rateStream => widget.rateStream;

  @override
  void initState() {
    super.initState();
    rateStream?.listen((rate) {
      if (rate == _currentRate) {
        return;
      }

      setState(() {
        _initialRate = _currentRate;
        _currentRate = rate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final formattedRate = intl.NumberFormat('#,##0.${'0' * widget.decimalPlaces}', 'en_US').format(_currentRate);
    final rateValue = formattedRate.toString().substring(0, formattedRate.indexOf('.'));
    final rateCents = formattedRate.toString().substring(formattedRate.indexOf('.') + 1);

    final formattedInitialRate =
        intl.NumberFormat('#,##0.${'0' * widget.decimalPlaces}', 'en_US').format(_initialRate);
    final initialRateValue = formattedInitialRate.toString().substring(0, formattedInitialRate.indexOf('.'));
    final initialRateCents = formattedInitialRate.toString().substring(formattedInitialRate.indexOf('.') + 1);

    const smallTextStyle = AppText.body2;
    final largeTextStyle = AppText.header0.copyWith(fontWeight: FontWeight.bold);
    final htFactor = largeTextStyle.fontSize / smallTextStyle.fontSize;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Odometer(
          [
            TextRun(widget.symbol, widget.symbol, smallTextStyle.copyWith(height: htFactor)),
            TextRun(rateValue, initialRateValue, largeTextStyle),
            TextRun('.', '.', smallTextStyle.copyWith(height: htFactor)),
            TextRun(rateCents, initialRateCents, smallTextStyle.copyWith(height: htFactor)),
          ],
        ),
      ],
    );
  }
}
