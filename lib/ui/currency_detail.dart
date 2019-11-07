import 'package:changeapp_common/model/currency.dart';
import 'package:flutter/material.dart';

import '../theme.dart';
import 'currency_icon.dart';

class CurrencyDetail extends StatelessWidget {
  final Currency currency;
  final double walletBalance;

  const CurrencyDetail(this.currency, {this.walletBalance}) : assert(currency != null);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final subHeader = walletBalance == null ? currency.code : currency.toStringAsFixed(walletBalance);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CurrencyIcon(currency),
        ConstrainedBox(
          constraints: BoxConstraints(minWidth: screenWidth < 350 ? 0.0 : 80.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(currency.name),
              new Text(
                subHeader,
                style: theme.textTheme.body1.copyWith(color: Colors.grey),
              ),
            ],
          )
        ),
      ],
    );
  }
}
