import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/text.dart';

class TextPair extends StatelessWidget {
  final String heading;
  final String body;
  final TextStyle bodyStyle;
  final TextStyle headingStyle;

  const TextPair(this.heading, this.body, {this.headingStyle = AppText.header3,
    this.bodyStyle = AppText.greyBody2});

  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(heading, style: headingStyle, textAlign: TextAlign.left),
        Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              body,
              style: bodyStyle,
            ))
      ],
    );
  }
}
