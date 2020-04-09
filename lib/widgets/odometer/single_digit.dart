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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SingleDigit &&
          runtimeType == other.runtimeType &&
          textStyle == other.textStyle &&
          boxDecoration == other.boxDecoration &&
          initialValue == other.initialValue &&
          finalValue == other.finalValue;

  @override
  int get hashCode => textStyle.hashCode ^ boxDecoration.hashCode ^ initialValue.hashCode ^ finalValue.hashCode;
}

class _SingleDigitState extends State<SingleDigit> with TickerProviderStateMixin {
  TextStyle get textStyle => widget.textStyle;

  BoxDecoration get boxDecoration => widget.boxDecoration;

  int get currentValue => widget.initialValue;

  int get finalValue => widget.finalValue;

  bool get isReverse => finalValue < currentValue;

  Animation<double> animation;
  AnimationController controller;

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

    final durationMillis = numCycles > 0 ? 500 ~/ numCycles : 500;
    controller = AnimationController(duration: Duration(milliseconds: durationMillis), vsync: this);
    animation = Tween<double>(begin: currentValue.toDouble(), end: finalValue.toDouble()).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final digitSize = TextRun.getSingleDigitSize('9', textStyle);
    return Container(
      decoration: boxDecoration,
      child: SizedOverflowBox(
        alignment: Alignment.topCenter,
        size: digitSize,
        child: ClipRect(
          clipper: CustomDigitClipper(digitSize),
          child: Transform.translate(
            offset: Offset(0, -animation.value * digitSize.height),
            child: Column(
              children: List<Widget>.generate(10, (int i) {
                final txt = '$i';
                return Text(txt, style: textStyle);
              }),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }
}

class CustomDigitClipper extends CustomClipper<Rect> {
  CustomDigitClipper(this.digitSize);

  final Size digitSize;

  @override
  Rect getClip(Size size) {
    return Rect.fromPoints(Offset.zero, Offset(digitSize.width, digitSize.height));
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}