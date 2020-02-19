import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/widgets/top_movers/top_movers_card.dart';

class TopMoversCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child:
        const TopMoversCard(
            currencyName: 'Bitcoin',
            currencyCode: 'BTC',
            percentage: '600.1%',
            isGrowing: true
        )
      )
    );
  }
}