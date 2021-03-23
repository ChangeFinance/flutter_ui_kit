import 'package:flutter/material.dart';

import '../../color.dart';

class LabelText extends StatelessWidget {
  final String data;

  const LabelText(this.data);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return new Text(
      data,
      style: theme.bodyText2.copyWith(
        color: AppColor.ltGreenPrimary,
        fontSize: 12.0,
        letterSpacing: 2.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
