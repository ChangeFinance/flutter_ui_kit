import 'package:flutter/material.dart';

class SimpleProgressIndicator extends StatefulWidget {
  final double progressIndicatorValue;
  final double roundedBorder;
  final double height;
  final bool background;
  final Color color;

  const SimpleProgressIndicator({
    Key key,
    this.progressIndicatorValue = 40.0,
    this.roundedBorder = 0.0,
    this.height = 6.0,
    this.background = false,
    this.color = Colors.greenAccent,
  }) : assert(progressIndicatorValue != null),
       super(key: key);

  @override
  _SimpleProgressIndicatorState createState() => _SimpleProgressIndicatorState();
}

class _SimpleProgressIndicatorState extends State<SimpleProgressIndicator> {
  @override
  Widget build(BuildContext context){

    print(widget.color);

    Color hasBackgroud() {
      if(widget.background) {
        return Colors.grey[200];
      } else {
        return Colors.white;
      }
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.roundedBorder),
      child: SizedBox(
        height: widget.height,
        child: LinearProgressIndicator(
          value: (widget.progressIndicatorValue * 0.01).toDouble(),
          backgroundColor: hasBackgroud(),
          valueColor: AlwaysStoppedAnimation<Color>(widget.color),
        ),
      ),
    );
  }
}