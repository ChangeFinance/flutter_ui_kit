import 'dart:async';

import 'package:flutter_ui_kit/color.dart';
import 'package:flutter/material.dart';

import 'button_common.dart';

class TwoStatesButton extends StatefulWidget {
  final String initialText;
  final String finalText;
  final int timeIntervalInSec;
  final Function onButtonCallback;
  final FutureCallback onPressed;
  final bool fullWidth;
  final bool narrow;
  final EdgeInsetsGeometry padding;
  final TextStyle textStyle;
  final bool resetButtonOnBuild;

  TwoStatesButton(
    this.initialText,
    this.finalText,
    this.timeIntervalInSec, {
    @required this.onButtonCallback,
    @required this.onPressed,
    this.fullWidth = false,
    this.narrow = false,
    this.padding,
    this.textStyle,
    this.resetButtonOnBuild = false,
    Key key,
  })  : assert(initialText != null),
        super(key: key);

  @override
  _TwoStatesButtonState createState() => _TwoStatesButtonState();
}

class _TwoStatesButtonState extends State<TwoStatesButton> with ButtonMixin {
  bool _enabled = true;
  Timer _timer;
  String _currentText;
  bool _resetState = false;

  @override
  void initState() {
    super.initState();
    _resetState = widget.resetButtonOnBuild;
    _startTimer();
  }

  void _startTimer() {
    setState(() => _currentText = widget.initialText);
    _timer = new Timer(Duration(seconds: widget.timeIntervalInSec), () {
      _resetState = false;
      setState(() => _currentText = widget.finalText);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _resetTimer() {
    if (_resetState) {
      if (_timer.isActive) {
        _timer.cancel();
      }
      _startTimer();
    } else {
      _resetState = widget.resetButtonOnBuild;
    }
  }

  @override
  Widget build(BuildContext context) {
    _resetTimer();
    return Container(
      width: widget.fullWidth ? matchParentWidth(context) : null,
      child: ElevatedButton(
        child: Text(
          _currentText,
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
            : () {
                if (_timer.isActive) {
                  disableButtonWhileOnPressedExecutes(setEnabled: _setEnabled, onPressed: widget.onPressed);
                } else {
                  _startTimer();
                  widget.onButtonCallback();
                }
              },
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

  void _setEnabled(bool enabled) {
    if (_enabled != enabled) {
      setState(() => _enabled = enabled);
    }
  }
}
