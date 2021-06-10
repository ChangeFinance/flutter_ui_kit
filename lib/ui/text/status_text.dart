import 'package:flutter/material.dart';

import '../colors.dart';

class ChgStatusText extends StatelessWidget {
  final String data;

  const ChgStatusText(this.data);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return new Text(
      data,
      style: theme.bodyText2!.copyWith(
        color: AppColors.primaryColor,
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
