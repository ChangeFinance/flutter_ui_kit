import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/theme.dart';
import 'package:flutter_ui_kit/widgets.dart';

class TopMoversCard extends StatelessWidget {
  final String currencyName;
  final String currencyCode;
  final String percentage;
  final bool isGrowing;
  final VoidCallback onTap;

  const TopMoversCard({this.currencyName, this.currencyCode, this.percentage, this.isGrowing, this.onTap});

  @override
  Widget build(BuildContext context) {
    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: _buildCard(context),
      );
    }
    return _buildCard(context);
  }

  Widget _buildCard(BuildContext context) {
    final color = isGrowing ? AppColor.green : AppColor.red;
    return AppCard(
        color: AppColor.deepWhite,
        elevation: 2,
        margin: const EdgeInsets.all(15),
        borderRadius: 4,
        child: Container(
            width: 130,
            height: 130,
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 23.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(currencyName),
                            new Text(currencyCode, style: theme.textTheme.body1.copyWith(color: Colors.grey))
                          ]
                      )
                  ),
                  new Text(percentage, style: theme.textTheme.display2.copyWith(color: color))
                ]
            )
        )
    );
  }

}