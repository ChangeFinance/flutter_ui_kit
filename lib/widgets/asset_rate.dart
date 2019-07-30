import 'package:flutter/material.dart';

import '../text.dart';

class AssetRate extends StatelessWidget {
  final String symbol;
  final double rate;

  const AssetRate(this.symbol, this.rate);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final value = rate.floor();
    final cents = (rate % 1).toStringAsFixed(2).substring(1);
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