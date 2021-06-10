import 'dart:math';

import 'package:flutter/material.dart';

class GaugeIndicator extends StatelessWidget {
  final double width;
  final double bearishThreshold;
  final double bullishThreshold;
  final double score;

  const GaugeIndicator({
    required this.width,
    required this.bearishThreshold,
    required this.bullishThreshold,
    required this.score
  })
      :assert(width > 0),
       assert(bearishThreshold >= 0 && bearishThreshold < 1),
       assert(bullishThreshold > 0 && bullishThreshold <= 1 && bullishThreshold > bearishThreshold),
       assert(score >= 0 && score <= 1);

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
          painter: _GaugePainter(width, width / 2, score, bearishThreshold, bullishThreshold),
        )
    );
  }
}

class _GaugePainter extends CustomPainter {

  final double width;
  final double height;
  final double score;
  final double bearishThreshold;
  final double bullishThreshold;

  _GaugePainter(this.width, this.height, this.score, this.bearishThreshold, this.bullishThreshold);

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
    const Gradient gradient = LinearGradient(
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
    canvas.drawArc(rect, pi, pi * bearishThreshold - delta, false, paint);

    paint.color = const Color(0xff9da0a6);
    canvas.drawArc(rect, pi + pi * bearishThreshold, pi * (bullishThreshold - bearishThreshold), false, paint);

    paint.color = const Color(0xff4ce2a7);
    canvas.drawArc(rect, 2 * pi - pi * (1 - bullishThreshold) + delta, pi * (1 - bullishThreshold) - delta, false, paint);

    final pointerCenter = gaugeCenter.translate(0, -7);
    paint.color = Colors.black;
    canvas.drawCircle(pointerCenter, 4.5, paint);

    final dx = cos(score * pi);
    final dy = sin(score * pi);
    final from = pointerCenter.translate(-8 * dx, -8 * dy);
    final to = pointerCenter.translate(-0.7 * height * dx, -0.7 * height * dy);
    canvas.drawLine(from, to, paint);

    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

}
