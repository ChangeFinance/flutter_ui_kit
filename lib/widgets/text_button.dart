import 'package:flutter_ui_kit/color.dart';
import 'package:flutter/material.dart';

import 'button_common.dart';

class TextButton extends StatefulWidget {
  final String text;
  final FutureCallback onPressed;
  final EdgeInsetsGeometry padding;
  final TextStyle textStyle;

  TextButton(
    this.text, {
    @required this.onPressed,
    this.padding,
    this.textStyle,
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
      child: FlatButton(
        child: Text(
          widget.text,
          style:  (widget.textStyle != null) ? widget.textStyle :
              Theme.of(context).textTheme.body1.copyWith(
                color: getTextColorOnWhiteBackground(
                  enabled: _enabled,
                  pressing: _pressing,
                  onPressed: widget.onPressed,
                ),
                fontSize: 12.0,
              ),
        ),
        onPressed: isDisabled(enabled: _enabled, onPressed: widget.onPressed)
            ? null
            : () => disableButtonWhileOnPressedExecutes(
                setEnabled: _setEnabled, onPressed: widget.onPressed),
        textColor: AppColor.green,
        padding: widget.padding ??
            const EdgeInsets.symmetric(vertical: 17.5, horizontal: 18.5),
      ),
    );
  }

  void _setEnabled(bool enabled) {
    setState(() => _enabled = enabled);
  }
}
