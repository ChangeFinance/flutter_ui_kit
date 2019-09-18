import 'dart:math';

import 'package:flutter/material.dart';

class GaugeIndicator extends StatelessWidget {
  static const double bearishThreshold = 38.0;
  static const double bullishThreshold = 62.0;

  final double width;
  final double percent;


  const GaugeIndicator({@required this.width, @required this.percent})
      :assert(width > 0),
       assert(percent >= 0 && percent <=100);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: width,
      height: width / 2,
      child: Stack(
        children: <Widget>[
          _gauge(context)
        ],
      ));
  }

  Widget _gauge(BuildContext context) {
    return Container(
        width: width,
        height: width / 2,
        child: CustomPaint(
          painter: _GaugePainter(width, width / 2, percent, bearishThreshold, bullishThreshold),
        )
    );
  }
}

class _GaugePainter extends CustomPainter {

  final double width;
  final double height;
  final double percent;
  final double bearishThreshold;
  final double bullishThreshold;

  _GaugePainter(this.width, this.height, this.percent, this.bearishThreshold, this.bullishThreshold);

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..isAntiAlias = true;


    final gaugeCenter = Offset(width/2, height);

    final bgDiameter = width * 0.92;
    final bgRadius = bgDiameter / 2;
    final bgOffset = (width - bgDiameter) / 2;
    final bgRect = Rect.fromCircle(center: gaugeCenter, radius: bgRadius);
    final Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: const [const Color(0x2172efdb), const Color(0x003edbb5)]
    );
    final bgPaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = gradient.createShader(Rect.fromLTWH(bgOffset, bgOffset, bgDiameter, bgRadius));

    canvas.drawArc(bgRect, pi, pi, true, bgPaint);

    final rect = Rect.fromCircle(center: gaugeCenter, radius: width / 2);
    const delta = 0.05;

    paint.color = const Color(0xffff6b6b);
    canvas.drawArc(rect, pi, pi * bearishThreshold / 100 - delta, false, paint);

    paint.color = const Color(0xff9da0a6);
    canvas.drawArc(rect, pi + pi * bearishThreshold / 100, pi * (bullishThreshold - bearishThreshold) / 100, false, paint);

    paint.color = const Color(0xff4ce2a7);
    canvas.drawArc(rect, 2 * pi - pi * (100 - bullishThreshold) / 100 + delta, pi * (100-bullishThreshold) / 100 - delta, false, paint);

    final pointerCenter = gaugeCenter.translate(0, -7);
    paint.color = Colors.black;
    canvas.drawCircle(pointerCenter, 4.5, paint);

    final dx = cos(percent * pi / 100);
    final dy = sin(percent * pi / 100);
    final from = pointerCenter.translate(-8 * dx, -8 * dy);
    final to = pointerCenter.translate(-0.7 * height * dx, -0.7 * height * dy);
    canvas.drawLine(from, to, paint);

    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

}
