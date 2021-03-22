import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ui_kit/color.dart';

import 'button_common.dart';

class BorderedButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool fullWidth;
  final bool narrow;
  final EdgeInsetsGeometry padding;
  final bool alt;
  final TextStyle textStyle;

  BorderedButton(
    this.text, {
    @required this.onPressed,
    this.fullWidth = false,
    this.narrow = false,
    this.padding,
    this.textStyle,
    this.alt = false,
    Key key,
  })  : assert(text != null),
        super(key: key);

  @override
  _BorderedButtonState createState() => _BorderedButtonState();
}

class _BorderedButtonState extends State<BorderedButton> with ButtonMixin {
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.fullWidth ? matchParentWidth(context) : null,
      child: OutlinedButton(
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
          side: MaterialStateProperty.resolveWith<BorderSide>((Set<MaterialState> states) {
            return BorderSide(
              color: states.contains(MaterialState.disabled)
                  ? AppColor.ltGrayMedium
                  : widget.alt
                      ? AppColor.ltDeepWhite
                      : AppColor.ltGreenPrimary,
            );
          }),
          overlayColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return AppColor.ltGreenDark;
            }
            return AppColor.ltGreenPrimary;
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
            if (states.contains(MaterialState.disabled)) {
              return AppColor.ltGrayMedium;
            }
            return widget.alt ? AppColor.ltDeepWhite : AppColor.ltGreenPrimary;
          }),
        ),
        child: Text(widget.text),
        onPressed:
            isDisabled(enabled: _enabled, onPressed: widget.onPressed) ? null : () => disableButtonWhileOnPressedExecutes(setEnabled: _setEnabled, onPressed: widget.onPressed),
      ),
    );
  }

  void _setEnabled(bool enabled) {
    setState(() => _enabled = enabled);
  }
}
