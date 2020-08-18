import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/widgets/odometer/text_run.dart';

class SingleDigit extends StatefulWidget {
  final TextStyle textStyle;
  final BoxDecoration boxDecoration;
  final int initialValue;
  final int finalValue;

  SingleDigit({
    Key key,
    this.boxDecoration = const BoxDecoration(color: Colors.transparent),
    this.textStyle = const TextStyle(color: Colors.black, fontSize: 30),
    this.initialValue = 0,
    this.finalValue = 1,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SingleDigitState();
}

class _SingleDigitState extends State<SingleDigit> with TickerProviderStateMixin {
  TextStyle get textStyle => widget.textStyle;

  BoxDecoration get boxDecoration => widget.boxDecoration;

  int get currentValue => widget.initialValue;

  int get finalValue => widget.finalValue;

  bool get isReverse => finalValue < currentValue;

  Animation<double> animation;
  AnimationController controller;
  static const text = '0\n1\n2\n3\n4\n5\n6\n7\n8\n9';

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  @override
  void didUpdateWidget(SingleDigit oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget != widget) {
      _initAnimation();
    }
  }

  void _initAnimation() {
    int numCycles;
    if (!isReverse) {
      numCycles = finalValue - currentValue;
    } else {
      numCycles = currentValue - finalValue;
    }

    final durationMillis = numCycles > 0 ? 1150 ~/ numCycles : 500;
    controller = AnimationController(duration: Duration(milliseconds: durationMillis), vsync: this);
    final curvedAnimation = CurvedAnimation(parent: controller, curve: Curves.easeOutQuint);
    animation = Tween<double>(begin: currentValue.toDouble(), end: finalValue.toDouble()).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final _digitSize = TextRun.getSingleDigitSize('5', textStyle, textScaleFactor: MediaQuery.of(context).textScaleFactor);
    return Container(
      decoration: boxDecoration,
      child: SizedOverflowBox(
        alignment: Alignment.topCenter,
        size: _digitSize,
        child: ClipRect(
          clipper: _CustomDigitClipper(_digitSize),
          child: Transform.translate(
            offset: Offset(0, -animation.value * _digitSize.height),
            child: Text(
              text,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

class _CustomDigitClipper extends CustomClipper<Rect> {
  const _CustomDigitClipper(this.digitSize);

  final Size digitSize;

  @override
  Rect getClip(Size size) {
    return Rect.fromPoints(Offset.zero, Offset(digitSize.width, digitSize.height));
  }

  @override
  bool shouldReclip(_CustomDigitClipper oldClipper) {
    return false;
  }
}
