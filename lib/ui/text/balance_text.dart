import 'package:flutter/material.dart';

class ChgBalanceAmount extends StatelessWidget {
  final String data;
  final EdgeInsets padding;

  const ChgBalanceAmount({
    @required this.data,
    this.padding = const EdgeInsets.all(6.0),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            data,
            style: theme.bodyText2.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 36.0,
            ),
          ),
        ),
      ],
    );
  }
}
