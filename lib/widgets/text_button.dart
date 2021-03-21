import 'package:flutter/widgets.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter/material.dart' as mat;

import 'button_common.dart';

@Deprecated('Use ChgTextButton')
class TextButton extends StatefulWidget {
  final String text;
  final FutureCallback onPressed;
  final EdgeInsetsGeometry padding;
  final TextStyle textStyle;
  final bool alt;

  TextButton(
    this.text, {
    @required this.onPressed,
    this.padding,
    this.textStyle,
    this.alt = false,
    Key key,
  })  : assert(text != null),
        super(key: key);

  @override
  _TextButtonState createState() => _TextButtonState();
}

class _TextButtonState extends State<TextButton> with ButtonMixin {
  bool _enabled = true;
  bool _pressing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() => _pressing = true);
      },
      onTapCancel: () {
        setState(() => _pressing = false);
      },
      child: mat.FlatButton(
        child: Text(
          widget.text,
          style: (widget.textStyle != null)
              ? widget.textStyle
              : mat.Theme.of(context).textTheme.bodyText2.copyWith(
                    color: !widget.alt
                        ? getTextColorOnWhiteBackground(
                            enabled: _enabled,
                            pressing: _pressing,
                            onPressed: widget.onPressed,
                          )
                        : (_enabled ? mat.Colors.white : AppColor.mediumGrey),
                    fontSize: 12.0,
                  ),
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
        textColor: widget.alt ? mat.Colors.white : AppColor.green,
        padding: widget.padding ??
            const EdgeInsets.symmetric(
              vertical: 17.5,
              horizontal: 18.5,
            ),
      ),
    );
  }

  void _setEnabled(bool enabled) {
    setState(() => _enabled = enabled);
  }
}

class ChgTextButton extends TextButton {
  ChgTextButton(
    String text, {
    FutureCallback onPressed,
    EdgeInsetsGeometry padding,
    TextStyle textStyle,
    bool alt,
    Key key,
  }) : super(
          text,
          onPressed: onPressed,
          padding: padding,
          textStyle: textStyle,
          alt: alt,
          key: key,
        );
}
