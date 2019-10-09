import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

import '../../color.dart';

class Badge extends StatelessWidget {
  static const double badgeHeight = 30.0;
  static const double fontSize = 14.0;
  static const double padding = 10.0;

  final String text;
  final double minWidth;
  final TextStyle textStyle;
  final Color bgColor;
  final VoidCallback onTap;

  const Badge(this.text, {this.minWidth, this.textStyle, this.bgColor, this.onTap});

  @override
  Widget build(BuildContext context) {
    const defaultTextStyle = TextStyle(color: AppColor.deepWhite, fontSize: fontSize);

    return Container(
        constraints: new BoxConstraints(
          minWidth: minWidth,
        ),
        width: null,
        height: badgeHeight,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(badgeHeight / 2)),
            color: bgColor ?? AppColor.green),
        child: GestureDetector(
            onTap: onTap,
            child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: padding),
                      child:
                      Shimmer.fromColors(
                        key: UniqueKey(),
                        baseColor: defaultTextStyle.color,
                        highlightColor: bgColor,
                        loop: 1,
                        period: const Duration(milliseconds: 750),
                        child: Text(
                          text,
                          style: textStyle ?? defaultTextStyle,
                          textAlign: TextAlign.right
                        ),
                      )
                  )
                ]
            )
        )
    );
  }
}
