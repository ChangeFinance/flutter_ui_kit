import 'package:flutter/material.dart';

class ChgAmountText extends StatelessWidget {
  final String data;
  final EdgeInsets padding;

  const ChgAmountText({
    required this.data,
    this.padding = const EdgeInsets.all(6.0),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: padding,
      child: new Text(
        data,
        style: theme.bodyText2!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
