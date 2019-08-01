import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/text.dart';

class Graph extends StatelessWidget {
  final bool enableMaxMin;
  final bool enableGradient;
  final Color lineColor;
  final String labelPrefix;
  final List<Ohlc> data;

  const Graph(
      { @required this.data,
        this.enableMaxMin = false,
        this.labelPrefix = '€',
        this.enableGradient = true,
        this.lineColor = AppColor.green
      });

  void _drawMaxMinMarkers(Canvas context, double width, double height) {
    const offsetLeftX = 35.0;
    const offsetRightX = 35.0;
    const offsetTopY = 0.0;
    const offsetDownY = 0.0;
    const lineWidth = 1.0;

    double _calcXForMarker(double x, double width) {
      if ((x - offsetLeftX) < 0) {
        return 0;
      }
      if ((x + offsetRightX * 2) > width) {
        return width - (offsetRightX * 2);
      }
      return x - offsetLeftX;
    }

    double _calcYForMarker(double y, double height) {
      if ((y - offsetTopY) < 0) {
        return offsetTopY;
      }
      if (y > (height - offsetDownY)) {
        return height - offsetDownY;
      }
      return y - offsetTopY;
    }

    final highPricesList = data.map((ohlc) => ohlc.h).toList();
    final lowPricesList = data.map((ohlc) => ohlc.l).toList();

    final maxValue = highPricesList.reduce(math.max);
    final minValue = lowPricesList.reduce(math.min);
    final widthNormalizer = width / data.length;
    final heightNormalizer = height / (maxValue - minValue);
    var maxValueDisplayed = false;
    var minValueDisplayed = false;

    void _drawLabel(double item, int i) {
      var displayedDecimals = 2;
      if (item < 1) {
        displayedDecimals = 4;
      } else if (item < 1000) {
        displayedDecimals = 3;
      }

      final tp = new TextPainter(
          text: new TextSpan(
              style: AppText.graphTextStyle.copyWith(
                  color: AppColor.deepWhite,
                  backgroundColor: Colors.transparent),
              text: (labelPrefix + item.toStringAsFixed(displayedDecimals)).padLeft(9)),
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.left);
      tp.layout();

      final x = i * widthNormalizer + lineWidth / 2;
      final y = height - (item - minValue) * heightNormalizer + lineWidth / 2;
      final offset =
          new Offset(_calcXForMarker(x, width), _calcYForMarker(y, height));

      final paint = Paint();
      context.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromLTWH(offset.dx - 3, offset.dy - 3, 68, 20),
              const Radius.circular(6.0)),
          paint);
      tp.paint(context, offset);
    }

    final openPricesList = data.map((ohlc) => ohlc.o).toList();

    for (var i = 0; i < openPricesList.length; i++) {
      if (!maxValueDisplayed && highPricesList[i] == maxValue) {
        maxValueDisplayed = true;
        _drawLabel(highPricesList[i], i);
      }
      if (!minValueDisplayed && lowPricesList[i] == minValue) {
        minValueDisplayed = true;
        _drawLabel(lowPricesList[i], i);
      }
    }
  }

  Gradient _buildGradient() {
    return new LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: const [
        Color.fromRGBO(114, 239, 219, 0.13),
        Color.fromRGBO(62, 219, 181, 0)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Container(
            child: new Sparkline(
      data: data.map((ohlc) => ohlc.o).toList(),
      lineColor: lineColor,
      lineWidth: 1.0,
      pointsMode: PointsMode.none,
      fillMode: enableGradient ? FillMode.below : FillMode.none,
      labelPrefix: labelPrefix,
      onGraphPaint: enableMaxMin ? _drawMaxMinMarkers : null,
      fillGradient: enableGradient ? _buildGradient() : null,
    )));
  }
}

class Ohlc {
  final double o;
  final double h;
  final double l;
  final double c;

  const Ohlc(this.o, this.h, this.l, this.c);

  @override
  String toString() {
    return 'o: $o, h: $h, l: $l, c: $c,';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Ohlc &&
              runtimeType == other.runtimeType &&
              o == other.o &&
              h == other.h &&
              l == other.l &&
              c == other.c;

  @override
  int get hashCode =>
      o.hashCode ^
      h.hashCode ^
      l.hashCode ^
      c.hashCode;
}
