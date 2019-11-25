import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import '../text.dart';

class AssetRate extends StatelessWidget {
  final String symbol;
  final double rate;

  const AssetRate(this.symbol, this.rate);

  @override
  Widget build(BuildContext context) {
    final formattedNumber = intl.NumberFormat('#,##0.00', 'en_US').format(rate);
    final value = formattedNumber.toString().substring(0, formattedNumber.indexOf('.'));
    final cents = formattedNumber.toString().substring(formattedNumber.indexOf('.'));
    return Column(
      children: <Widget>[
        RichText(
          text: TextSpan(
              children: [
                new TextSpan(text: '$symbol ',
                    style: AppText.body2),
                new TextSpan(text: '$value',
                    style: AppText.header0.copyWith(fontWeight: FontWeight.bold)),
                new TextSpan(text: '$cents',
                    style: AppText.body2),
              ]
          )
        )
      ],
    );
  }
}
