import 'package:flutter/material.dart';

import '../colors.dart';

class ChgLink extends StatelessWidget {
  final String data;
  final Function? onTap;

  const ChgLink(
    this.data, {
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Text(
        data,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: AppColors.primaryColor,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid,
            ),
      ),
    );
  }
}
