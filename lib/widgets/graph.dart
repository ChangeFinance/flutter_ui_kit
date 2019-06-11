import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class Graph extends StatelessWidget {

  final bool enableMaxMin;
  final String labelPrefix;
  final List<double> data;
  Graph({@required this.data, Key key, this.enableMaxMin = false, this.labelPrefix = '€'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        child: new Sparkline(
        sharpCorners: true,
        data: data,
        lineColor: const Color.fromRGBO(62, 219, 181, 1),
        lineWidth: 1.0,
        pointsMode: PointsMode.none,
        fillMode: FillMode.below,
        enableMaxMin: enableMaxMin,
        labelPrefix: labelPrefix,
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
