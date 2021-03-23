import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';

import 'button_common.dart';

class FilledButton extends StatefulWidget {
  final String text;
  final FutureCallback onPressed;
  final bool fullWidth;
  final bool narrow;
  final EdgeInsetsGeometry padding;
  final TextStyle textStyle;
  final Color color;

  FilledButton(
    this.text, {
    @required this.onPressed,
    this.fullWidth = false,
    this.narrow = false,
    this.padding,
    this.textStyle,
    this.color = AppColor.ltGreenPrimary,
    Key key,
  })  : assert(text != null),
        super(key: key);

  @override
  _FilledButtonState createState() => _FilledButtonState();
}

class _FilledButtonState extends State<FilledButton> with ButtonMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.fullWidth ? matchParentWidth(context) : null,
      child: ElevatedButton(
        child: Text(widget.text),
        onPressed: widget.onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.resolveWith<double>((Set<MaterialState> states) {
            return 0;
          }),
          padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>((Set<MaterialState> states) {
            return widget.padding ?? getPadding(narrow: widget.narrow);
          }),
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>((Set<MaterialState> states) {
            return const StadiumBorder();
          }),
          overlayColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return AppColor.ltGreenDark;
            }
            return widget.color ?? AppColor.ltGreenPrimary;
          }),
          backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColor.ltGrayMedium;
            }
            return widget.color ?? AppColor.ltGreenPrimary;
          }),
          textStyle: MaterialStateProperty.resolveWith<TextStyle>((Set<MaterialState> states) {
            return (widget.textStyle != null)
                ? widget.textStyle
                : Theme.of(context).textTheme.bodyText2.copyWith(
                      fontSize: getFontSize(
                        narrow: widget.narrow,
                        fullWidth: widget.fullWidth,
                      ),
                    );
          }),
          foregroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            return AppColor.ltDeepWhite;
          }),
        ),
      ),
    );
  }
}
