import 'package:flutter/material.dart';

import '../../color.dart';

class TextPair extends StatelessWidget {
  final String heading;
  final String body;
  final Color textColor;

  const TextPair(this.heading, this.body, {this.textColor = AppColor.semiGrey});

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context).textTheme;
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(heading, style: theme.headline4, textAlign: TextAlign.left),
        Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              body,
              style: theme.bodyText1.copyWith(color: textColor),
            ))
      ],
    );
  }
}
