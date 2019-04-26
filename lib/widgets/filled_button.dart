import 'package:change_ui_kit/color.dart';
import 'package:flutter/material.dart';

import 'button_common.dart';

class FilledButton extends StatefulWidget {
  final String text;
  final FutureCallback onPressed;
  final bool fullWidth;
  final bool narrow;

  FilledButton(
    this.text, {
    @required this.onPressed,
    this.fullWidth = true,
    this.narrow = false,
    Key key,
  })  : assert(text != null),
        super(key: key);

  @override
  _FilledButtonState createState() => _FilledButtonState();
}

class _FilledButtonState extends State<FilledButton> with ButtonMixin {
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    if (widget.fullWidth) {
      return wrapInFullWidthContainer(context, _buildButton());
    }
    return _buildButton();
  }

  Widget _buildButton() {
    return RaisedButton(
      child: Text(
        widget.text,
        style: TextStyle(
          color: AppColor.deepWhite,
          fontSize: ButtonStyleConstants.fontSize,
        ),
      ),
      onPressed: isDisabled(enabled: _enabled, onPressed: widget.onPressed)
          ? null
          : () => disableButtonWhileOnPressedExecutes(
              setEnabled: _setEnabled, onPressed: widget.onPressed),
      padding: getPadding(narrow: widget.narrow),
      elevation: 0.0,
      highlightElevation: 0.0,
      disabledElevation: 0.0,
      textColor: AppColor.deepWhite,
      disabledTextColor: AppColor.deepWhite,
      disabledColor: AppColor.mediumGrey,
      highlightColor: AppColor.darkerGreen,
    );
  }

  void _setEnabled(bool enabled) {
    if (_enabled != enabled) {
      setState(() => _enabled = enabled);
    }
  }
}
