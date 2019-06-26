import 'package:flutter/material.dart';

class BottomGreenProgressIndicator extends StatefulWidget {
  final double progressIndicatorValue;
  final double roundedBorder;

  const BottomGreenProgressIndicator({
    Key key,
    this.progressIndicatorValue = 4.0,
    this.roundedBorder = 0.0
  }) : assert(progressIndicatorValue != null),
       super(key: key);

  @override
  _BottomGreenProgressIndicatorState createState() => _BottomGreenProgressIndicatorState();

}

class _BottomGreenProgressIndicatorState extends State<BottomGreenProgressIndicator> {

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.only(right: 20.0, left: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.roundedBorder),
        child: LinearProgressIndicator(
          value: widget.progressIndicatorValue * 0.01
          ),
        )
    );
  }
}