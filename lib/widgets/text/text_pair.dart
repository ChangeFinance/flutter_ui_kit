import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/text.dart';

class TextPair extends StatelessWidget {
  final String heading;
  final String body;

  const TextPair(this.heading, this.body);

  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(heading, style: AppText.header3, textAlign: TextAlign.left),
        Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              body,
              style: AppText.greyBody2,
            ))
      ],
    );
  }
}
