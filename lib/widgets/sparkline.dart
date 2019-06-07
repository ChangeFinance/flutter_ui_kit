import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

math.Random random = new math.Random();

class SparkLine extends StatefulWidget {

  const SparkLine({Key key}) : super(key: key);

  @override
  SparkLineWidgetState createState() => SparkLineWidgetState();
}

class SparkLineWidgetState extends State<SparkLine> {

  static List<double> _generateRandomData(int count) {
    final result = <double>[];
    for (var i = 0; i < count; i++) {
      result.add(random.nextDouble() * 10000);
    }
    return result;
  }

  List<double> _data = _generateRandomData(50);

  void onRefresh() {
    setState(() {
      _data = _generateRandomData(50);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Container(
            child: new Sparkline(
      data: _data,
      lineColor: const Color.fromRGBO(62, 219, 181, 1),
      lineWidth: 1.0,
      pointsMode: PointsMode.none,
      fillMode: FillMode.below,
      fillGradient: new LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: const [
          Color.fromRGBO(114, 239, 219, 0.13),
          Color.fromRGBO(62, 219, 181, 0)
        ],
      ),
    )));
  }
}
