import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../colors.dart';

class Heading extends StatelessWidget {
  final String data;
  final BoxConstraints constraints;

  const Heading(this.data, {this.constraints});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            constraints: constraints,
              child: Text(
                data,
                style: const TextStyle(
                    color: Colors.black,
                  fontSize: 30,
                  fontFamily: 'DINNextLTPro',
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

class GradientPainter extends CustomPainter {
  final String data;
  final TextStyle textStyle;

  const GradientPainter(this.data, this.textStyle);

  @override
  void paint(Canvas canvas, Size size) {
    final fullRect = new Rect.fromLTWH(0.0, 0.0, size.width, size.height);

    final gradientPaint = new Paint()
      ..shader = AppColors.headingGradient.createShader(fullRect);

    final paragraphStyle =
        textStyle.getParagraphStyle(textAlign: TextAlign.center);
    final paragraphBuilder = new ui.ParagraphBuilder(paragraphStyle)
      ..pushStyle(new ui.TextStyle(
          foreground: gradientPaint, letterSpacing: textStyle.letterSpacing))
      ..addText(data);
    final paragraph = paragraphBuilder.build();
    paragraph.layout(new ui.ParagraphConstraints(width: size.width));

    canvas.drawParagraph(paragraph, const Offset(0.0, 0.0));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
