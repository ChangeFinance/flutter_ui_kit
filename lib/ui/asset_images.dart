import 'package:flutter/material.dart';

class AssetImages {
  AssetImages._();

  static const Image cards = const Image(
    image: AssetImage('assets/images/card/cards.png'),
    fit: BoxFit.fitWidth,
    height: 300.0,
    alignment: Alignment.center,
  );

  static const Image card = const Image(
    image: AssetImage('assets/images/card/card.png'),
    fit: BoxFit.cover,
    width: 350.0,
    alignment: Alignment.bottomLeft,
  );

  static const Image potOfGold = const Image(
    image: AssetImage('assets/images/market/pot-of-gold.svg'),
    fit: BoxFit.cover,
    width: 350.0,
    alignment: Alignment.bottomLeft,
  );

}
