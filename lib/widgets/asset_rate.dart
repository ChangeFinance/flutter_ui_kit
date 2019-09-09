import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import '../text.dart';

class AssetRate extends StatelessWidget {
  final String symbol;
  final double rate;

  const AssetRate(this.symbol, this.rate);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final formattedNumber = intl.NumberFormat('#,##0.00', 'en_US').format(rate);
    final value = formattedNumber.toString().substring(0, formattedNumber.indexOf('.'));
    final cents = formattedNumber.toString().substring(formattedNumber.indexOf('.'));
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('$symbol ',
                style: AppText.body2),
            new Text('$value',
                style: AppText.header0.copyWith(fontWeight: FontWeight.bold)),
            new Text('$cents',
                style: theme.body2),
          ],
        )
      ],
    );
  }
}
