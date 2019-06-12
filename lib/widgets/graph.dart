import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/text.dart';

class Graph extends StatelessWidget {

  final bool enableMaxMin;
  final String labelPrefix;
  final List<double> data;
  const Graph({@required this.data, Key key, this.enableMaxMin = false, this.labelPrefix = '€'}) : super(key: key);

  void _drawMaxMinMarkers(Canvas context, double width, double height) {
    const offsetLeftX = 30.0;
    const offsetRightX = 30.0;
    const offsetTopY = 5.0;
    const offsetDownY = 25.0;
    const lineWidth = 1.0;

    double _calcXForMarker(double x , double width) {
      if ((x - offsetLeftX) < 0)
        return 0;
      if ((x + offsetRightX * 2) > width)
        return width - (offsetRightX * 2);
      return x - offsetLeftX;
    }

    double _calcYForMarker(double y , double height) {
      if ((y - offsetTopY) < 0)
        return offsetTopY;
      if (y > (height - offsetDownY))
        return height - offsetDownY;
      return y - offsetTopY;
    }

    final maxValue = data.reduce(math.max);
    final minValue = data.reduce(math.min);
    final widthNormalizer = width / data.length;
    final heightNormalizer = height / (maxValue - minValue);

    void _drawLabel(double item, int i) {
      final tp = new TextPainter(
          text: new TextSpan(
              style: AppText.graphTextStyle.copyWith(color: AppColor.deepWhite, fontSize: 15.0, backgroundColor: Colors.black ),
              text: labelPrefix + item.toString().substring(0 , 7)
          ) ,
          textDirection: TextDirection.ltr ,
          textAlign: TextAlign.left);
      tp.layout();
      final x = i * widthNormalizer + lineWidth / 2;
      final y = height - (item - minValue) * heightNormalizer + lineWidth / 2;
      tp.paint(context, new Offset(_calcXForMarker(x, width), _calcYForMarker(y, height)));
    }

    for (var i = 0; i < data.length; i++) {
      final item = data[i];
      if (item == maxValue || item == minValue) {
        _drawLabel(item, i);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        child: new Sparkline(
        data: data,
        lineColor: const Color.fromRGBO(62, 219, 181, 1),
        lineWidth: 1.0,
        pointsMode: PointsMode.none,
        fillMode: FillMode.below,
        labelPrefix: labelPrefix,
        onGraphPaint: enableMaxMin ? _drawMaxMinMarkers : null,
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
