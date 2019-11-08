import 'package:flutter/material.dart';

import '../colors.dart';

class AmountSelectionButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const AmountSelectionButton(this.text, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
                color: AppColors.colorNeutralLight,
                width: 1.0,
                style: BorderStyle.solid),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
            child:
                Text(text, style: const TextStyle(color: AppColors.secondary)),
          ),
        ),
      ),
    );
  }
}
