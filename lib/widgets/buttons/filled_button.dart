import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';

import '../button_common.dart';

class ChgFilledButton extends StatefulWidget {
  final String text;
  final FutureCallback onPressed;
  final bool fullWidth;
  final bool narrow;
  final EdgeInsetsGeometry padding;
  final TextStyle textStyle;
  final Color color;

  ChgFilledButton(
    this.text, {
    @required this.onPressed,
    this.fullWidth = false,
    this.narrow = false,
    this.padding,
    this.textStyle,
    this.color,
    Key key,
  })  : assert(text != null),
        super(key: key);

  @override
  _ChgFilledButtonState createState() => _ChgFilledButtonState();
}

class _ChgFilledButtonState extends State<ChgFilledButton> with ButtonMixin {
  bool _enabled = true;

  Color get color => widget.color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.fullWidth ? matchParentWidth(context) : null,
      child: RaisedButton(
        child: Text(
          widget.text,
          style: (widget.textStyle != null)
              ? widget.textStyle
              : Theme.of(context).textTheme.bodyText2.copyWith(
                    color: AppColor.deepWhite,
                    fontSize: getFontSize(
                      narrow: widget.narrow,
                      fullWidth: widget.fullWidth,
                    ),
                  ),
        ),
        onPressed: isDisabled(enabled: _enabled, onPressed: widget.onPressed)
            ? null
            : () => disableButtonWhileOnPressedExecutes(
                  setEnabled: _setEnabled,
                  onPressed: widget.onPressed,
                ),
        padding: widget.padding ?? getPadding(narrow: widget.narrow),
        elevation: 0.0,
        highlightElevation: 0.0,
        disabledElevation: 0.0,
        textColor: AppColor.deepWhite,
        disabledTextColor: AppColor.deepWhite,
        disabledColor: AppColor.mediumGrey,
        color: color,
        highlightColor: color ?? AppColor.darkerGreen,
      ),
    );
  }

  void _setEnabled(bool enabled) {
    if (_enabled != enabled) {
      if (mounted) {
        setState(() => _enabled = enabled);
      }
    }
  }
}
