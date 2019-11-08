import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/widgets/card.dart';

class Paper extends StatelessWidget {
  final List<Widget> children;
  final VoidCallback onTap;
  final BoxDecoration decoration;
  final EdgeInsets padding;

  const Paper({this.children, this.onTap, this.decoration, this.padding});

  @override
  Widget build(BuildContext context) {
    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: _buildPaper(context),
      );
    }
    return _buildPaper(context);
  }

  Widget _buildPaper(BuildContext context) {
    return AppCard(
      color: AppColor.deepWhite,
        elevation: 2,
        margin: const EdgeInsets.fromLTRB(7.0, 1.0, 7.0, 6.0),
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 81.0,
          ),
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 15.0, vertical: 23.0),
          decoration: decoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        ));
  }
}
