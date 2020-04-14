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
  final TextStyle largeTextStyle;
  final TextStyle smallTextStyle;

  AnimatedAssetRate(this.symbol,
      this.rateStream, {
        this.decimalPlaces = 2,
      })
      : assert(decimalPlaces > 0),
        largeTextStyle = AppText.header0.copyWith(fontWeight: FontWeight.bold),
        smallTextStyle =
        AppText.body2.copyWith(height: (AppText.header0.fontSize / AppText.body2.fontSize).roundToDouble());

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
    rateStream?.map((r) => double.parse(r.toStringAsFixed(widget.decimalPlaces)))?.listen((rate) {
      if (_formatRate(rate) == _formatRate(_currentRate)) {
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
    final formattedRate = _formatRate(_currentRate);
    final rateValue = formattedRate.toString().substring(0, formattedRate.indexOf('.'));
    final rateCents = formattedRate.toString().substring(formattedRate.indexOf('.') + 1);

    final formattedInitialRate = _formatRate(_initialRate);
    final initialRateValue = formattedInitialRate.toString().substring(0, formattedInitialRate.indexOf('.'));
    final initialRateCents = formattedInitialRate.toString().substring(formattedInitialRate.indexOf('.') + 1);

    final smallTextStyle = widget.smallTextStyle.copyWith(height: 3.5);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Odometer(
          [
            TextRun(widget.symbol, widget.symbol, smallTextStyle),
            TextRun(rateValue, initialRateValue, widget.largeTextStyle),
            TextRun('.', '.', smallTextStyle),
            TextRun(rateCents, initialRateCents, smallTextStyle),
          ],
        ),
      ],
    );
  }

  String _formatRate(double rate) => intl.NumberFormat('#,##0.${'0' * widget.decimalPlaces}', 'en_US').format(rate);
}
