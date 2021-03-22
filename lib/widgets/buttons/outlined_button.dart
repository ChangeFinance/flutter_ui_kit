import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../color.dart';
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
        style: OutlinedButton.styleFrom(
          elevation: 0,
          animationDuration: const Duration(milliseconds: 400),
          shape: const StadiumBorder(),
          primary: widget.alt ? AppColor.ltDeepWhite : AppColor.ltGreenPrimary,
          padding: widget.padding ?? getPadding(narrow: widget.narrow),
          textStyle: widget.textStyle != null
              ? widget.textStyle
              : Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: getFontSize(
                      narrow: widget.narrow,
                      fullWidth: widget.fullWidth,
                    ),
                  ),
        ).copyWith(
          side: MaterialStateProperty.resolveWith<BorderSide>((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return const BorderSide(color: AppColor.ltGrayMedium);
            }
            if (widget.alt) {
              return const BorderSide(color: AppColor.ltDeepWhite);
            }
            return const BorderSide(color: AppColor.ltGreenPrimary);
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
