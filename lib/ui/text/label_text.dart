import 'package:flutter/material.dart';

import '../colors.dart';

class ChgLabelText extends StatelessWidget {
  final String data;

  const ChgLabelText(this.data);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return new Text(
      data,
      style: theme.bodyText2.copyWith(
          color: AppColors.primaryColor,
          fontSize: 12.0,
          letterSpacing: 2.0,
          fontWeight: FontWeight.w500),
    );
  }
}
