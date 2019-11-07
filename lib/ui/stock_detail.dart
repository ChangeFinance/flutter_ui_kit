import 'package:changeapp_common/model/stock.dart';
import 'package:flutter/material.dart';

import '../theme.dart';
import 'stock_icon.dart';

class StockDetail extends StatelessWidget {
  final Stock stock;

  const StockDetail(this.stock) : assert(stock != null);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ColourfulStockIcon(stock),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(stock.name),
            new Text(
              stock.description,
              style: theme.textTheme.body1.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
