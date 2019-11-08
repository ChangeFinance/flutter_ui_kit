import 'package:flutter/material.dart';

enum BodyStyle { body1, body2, caption, title }

class Body extends StatelessWidget {
  final String data;
  final BodyStyle style;
  final TextAlign textAlign;

  const Body(this.data, {this.textAlign = TextAlign.start, this.style});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(data, textAlign: textAlign, style: _textStyle(textTheme)),
    );
  }

  TextStyle _textStyle(TextTheme textTheme) {
    switch (style) {
      case BodyStyle.title:
        return textTheme.title;
      case BodyStyle.caption:
        return textTheme.caption;
      case BodyStyle.body2:
        return textTheme.body2;
      default:
        return textTheme.body1;
    }
  }
}
