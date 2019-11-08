import 'package:flutter/material.dart';

import '../colors.dart';

class Link extends StatelessWidget {
  final String data;
  final Function onTap;

  const Link(this.data, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        data,
        style: Theme.of(context).textTheme.body1.copyWith(
            color: AppColors.primaryColor,
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.solid),
      ),
    );
  }
}
