import 'package:flutter/material.dart' as mat;
import 'package:flutter/widgets.dart';
import 'package:flutter_ui_kit/color.dart';

import '../button_common.dart';

class ChgOutlinedButton extends StatefulWidget {
  final String text;
  final FutureCallback onPressed;
  final bool fullWidth;
  final bool narrow;
  final EdgeInsetsGeometry padding;
  final bool alt;

  ChgOutlinedButton(
    this.text, {
    @required this.onPressed,
    this.fullWidth = false,
    this.narrow = false,
    this.padding,
    this.alt = false,
    Key key,
  })  : assert(text != null),
        super(key: key);

  @override
  _ChgOutlinedButtonState createState() => _ChgOutlinedButtonState();
}

class _ChgOutlinedButtonState extends State<ChgOutlinedButton> with ButtonMixin {
  bool _enabled = true;
  bool _pressing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.fullWidth ? matchParentWidth(context) : null,
      child: GestureDetector(
        onTapDown: (_) {
          setState(() => _pressing = true);
        },
        onTapCancel: () {
          setState(() => _pressing = false);
        },
        child: mat.OutlineButton(
          child: Text(
            widget.text,
            style: mat.Theme.of(context).textTheme.bodyText2.copyWith(
                  color: !widget.alt
                      ? getTextColorOnWhiteBackground(
                          enabled: _enabled,
                          pressing: _pressing,
                          onPressed: widget.onPressed,
                        )
                      : (_enabled ? mat.Colors.white : AppColor.mediumGrey),
                  fontSize: getFontSize(narrow: widget.narrow, fullWidth: widget.fullWidth),
                ),
          ),
          onPressed:
              isDisabled(enabled: _enabled, onPressed: widget.onPressed) ? null : () => disableButtonWhileOnPressedExecutes(setEnabled: _setEnabled, onPressed: widget.onPressed),
          padding: widget.padding ?? getPadding(narrow: widget.narrow),
          textColor: widget.alt ? mat.Colors.white : AppColor.green,
          borderSide: BorderSide(color: widget.alt ? mat.Colors.white : AppColor.green),
          highlightedBorderColor: widget.alt ? mat.Colors.white : AppColor.green,
          disabledBorderColor: AppColor.mediumGrey,
        ),
      ),
    );
  }

  void _setEnabled(bool enabled) {
    setState(() => _enabled = enabled);
  }
}
