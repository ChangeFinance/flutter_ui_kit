import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ui_kit/color.dart';

import 'button_common.dart';

class PlainButton extends StatefulWidget {
  final String text;
  final FutureCallback onPressed;
  final EdgeInsetsGeometry padding;
  final TextStyle textStyle;
  final bool alt;

  PlainButton(
    this.text, {
    @required this.onPressed,
    this.padding,
    this.textStyle,
    this.alt = false,
    Key key,
  })  : assert(text != null),
        super(key: key);

  @override
  _PlainButtonState createState() => _PlainButtonState();
}

class _PlainButtonState extends State<PlainButton> with ButtonMixin {
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(widget.text),
      style: ButtonStyle(
        elevation: MaterialStateProperty.resolveWith<double>((Set<MaterialState> states) {
          return 0;
        }),
        padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>((Set<MaterialState> states) {
          return widget.padding ??
              const EdgeInsets.symmetric(
                vertical: 17.5,
                horizontal: 18.5,
              );
        }),
        textStyle: MaterialStateProperty.resolveWith<TextStyle>((Set<MaterialState> states) {
          return widget.textStyle != null
              ? widget.textStyle
              : Theme.of(context).textTheme.bodyText2.copyWith(
                    color: widget.alt ? AppColor.ltDeepWhite : AppColor.ltGreenPrimary,
                  );
        }),
      ),
      onPressed: isDisabled(
        enabled: _enabled,
        onPressed: widget.onPressed,
      )
          ? null
          : () => disableButtonWhileOnPressedExecutes(
                setEnabled: _setEnabled,
                onPressed: widget.onPressed,
              ),
    );
  }

  void _setEnabled(bool enabled) {
    setState(() => _enabled = enabled);
  }
}
