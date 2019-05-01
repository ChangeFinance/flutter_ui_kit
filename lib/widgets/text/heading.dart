import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/widgets/text/heading_type.dart';

class Heading extends StatelessWidget {
  final String data;
  final BoxConstraints constraints;
  final HeadingType headingType;
  final TextAlign textAlign;

  const Heading(this.data, {this.constraints, this.headingType, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: _textStyle(context),
      textAlign: textAlign,
    );
  }

  TextStyle _textStyle(BuildContext context) {
    switch(headingType) {
      case HeadingType.HEADING_0: return Theme.of(context).textTheme.display4;
      case HeadingType.HEADING_1: return Theme.of(context).textTheme.display3;
      case HeadingType.HEADING_2: return Theme.of(context).textTheme.display2;
      case HeadingType.HEADING_3: return Theme.of(context).textTheme.display1;
      case HeadingType.HEADING_4: return Theme.of(context).textTheme.subhead;
      default: return Theme.of(context).textTheme.display2;
    }
  }
}