import 'package:changeapp_common/model/currency.dart';
import 'package:flutter/material.dart';

import 'svg_icon.dart';

class CurrencyIcon extends StatelessWidget {
  final Currency currency;

  static Map<String, SvgIcon> getIcons() {
    return _icons;
  }

  static final Map<String, SvgIcon> _icons = {
    'CNG': SvgIcons.changeicon,
    'CAG': SvgIcons.changeicon,
    'BTC': SvgIcons.bitcoin,
    'ETH': SvgIcons.ether,
    'LTC': SvgIcons.litecoin,
    'XRP': SvgIcons.ripple,
    'USDT': SvgIcons.tether,
    'DASH': SvgIcons.dash,
    'EURT': SvgIcons.euro,
    'EUR': SvgIcons.euro,
    'EOS': SvgIcons.eos,
    'XLM': SvgIcons.stellar,
    'BCH': SvgIcons.bitcoinCash,
  };

  const CurrencyIcon(this.currency) : assert(currency != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.0,
      padding: const EdgeInsets.only(right: 5.0),
      child: Center(child: _icons[currency.code]),
    );
  }

  SvgIcon get icon => _icons[currency.code];
}

class ColourfulCurrencyIcon extends StatelessWidget {
  final Currency currency;

  static final Map<String, Widget> _icons = {
    'BTC': SvgIcons.colourfulBitcoin,
    'CNG': SvgIcons.colourfulChange,
    'CAG': SvgIcons.colourfulChange,
    'ETH': SvgIcons.colourfulEther,
    'LTC': SvgIcons.colourfulLitecoin,
    'XRP': SvgIcons.colourfulRipple,
    'USDT': SvgIcons.colourfulTether,
    'EURT': SvgIcons.euro,
    'EUR': SvgIcons.euro,
    'DASH': SvgIcons.colourfulDash,
    'EOS': SvgIcons.colourfulEos,
    'XLM': SvgIcons.colourfulStellar,
    'BCH': SvgIcons.colourfulBitcoinCash,
  };

  const ColourfulCurrencyIcon(this.currency) : assert(currency != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 5.0),
      child: _icons[currency.code],
    );
  }
}
