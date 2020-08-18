import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';

class LabelText extends StatelessWidget {
  final String data;

  const LabelText(this.data);

  @override
  Widget build(BuildContext context) {
    final theme = Theme
        .of(context)
        .textTheme;
    return new Text(
      data,
      style: theme.body1.copyWith(
          color: AppColor.semiGrey,
          fontSize: 12.0,
          fontFamily: 'DINNextLTPro',
          letterSpacing: 1.0,
          height: 1.0,
          fontWeight: FontWeight.normal),
    );
  }
}
