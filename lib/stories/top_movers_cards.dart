import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/widgets/top_movers/top_movers_card.dart';

class TopMoversCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: const SingleChildScrollView(
            child: const Padding(
                padding: EdgeInsets.all(15),
                child: const TopMoversCard(
                    currencyName: 'Bitcoin',
                    currencyCode: 'BTC',
                    percentage: '600.1%',
                    isGrowing: true))));
  }
}