
import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_kit/color.dart';

class DrawCircle extends CustomPainter {
  Paint _paint;
  final Color circleColor;

  DrawCircle(this.circleColor) {
    _paint = Paint()
      ..color = circleColor
      ..strokeWidth = 7.0
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(const Offset(0.0, 0.0), 7.0, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class PasscodeWidget extends StatelessWidget {
  final int filledNumber;
  final int totalNumber;
  final bool hasError;

  const PasscodeWidget({
    @required this.totalNumber,
    @required this.filledNumber,
    this.hasError = false
  });

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    for (var i = 0; i < totalNumber; i++) {
      var color = AppColor.moreBlueGrey;
      if (hasError) {
        color = AppColor.red;
      } else if (i < filledNumber) {
        color = AppColor.brightGreen;
      }
      children.add(Container(
        child: CustomPaint(painter: DrawCircle(color)),
      ));
    }

    return Center(
        child: Container(
            constraints: const BoxConstraints(maxWidth: 160),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            )
        )
    );
  }
}
