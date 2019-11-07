import 'package:changeapp_common/model/stock.dart';
import 'package:flutter/material.dart';

import 'svg_icon.dart';

class StockIcon extends StatelessWidget {
  final Stock stock;

  static final Map<String, SvgIcon> _icons = {};

  const StockIcon(this.stock) : assert(stock != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 5.0),
      child: _icons[stock.code],
    );
  }
}

class ColourfulStockIcon extends StatelessWidget {
  final Stock stock;

  static final Map<String, Widget> _icons = {
    'CAGI': SvgIcons.colourfulCryptoCurrencyIndex,
    'BUNDLE': SvgIcons.colourfulBundle,
    'AAPL': SvgIcons.colourfulApple,
    'DGX': SvgIcons.colourfulDigix,
  };

  const ColourfulStockIcon(this.stock) : assert(stock != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 5.0),
      child: _icons[stock.code],
    );
  }
}
