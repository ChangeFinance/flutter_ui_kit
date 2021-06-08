import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/text.dart';

typedef Callback = void Function(String value);

class PasscodeNumPadText extends StatefulWidget {
  final Callback onChange;
  final int? textLengthLimit;
  final Callback? onKey;
  final String? actionButtonText;
  final VoidCallback? onActionbuttonPressed;
  final bool? enabled;
  final bool needNumPadTextUpdate;
  final bool? hasSecondaryActionButton;
  final Widget? secondaryActionWidget;
  final VoidCallback? onSecondaryActionButtonPressed;

  const PasscodeNumPadText({
    required this.onChange,
    this.textLengthLimit = 0,
    this.onKey,
    this.actionButtonText,
    this.onActionbuttonPressed,
    this.enabled = true,
    this.needNumPadTextUpdate = false,
    this.hasSecondaryActionButton = false,
    this.secondaryActionWidget,
    this.onSecondaryActionButtonPressed,
  }) : assert(!(hasSecondaryActionButton == true && secondaryActionWidget == null));

  @override
  _PasscodeNumPadTextState createState() => _PasscodeNumPadTextState();
}

class _PasscodeNumPadTextState extends State<PasscodeNumPadText> {
  bool? get enabled => widget.enabled;

  String _text = '';

  void onKeyTapped(String key) {
    if (!'0123456789C'.contains(key)) {
      return;
    }

    final isCancel = 'C' == key;

    if (widget.onKey != null) {
      widget.onKey!(key);
    }

    if (widget.needNumPadTextUpdate) {
      _text = '';
    }

    if (!isCancel) {
      if (widget.textLengthLimit! > 0 && (_text + key).length > widget.textLengthLimit!) {
        return;
      }
      _text += key;
    } else {
      _text = _text.isNotEmpty ? _text.substring(0, _text.length - 1) : '';
    }

    setState(() {});
    widget.onChange(_text);
  }

  Widget buildKeyItem(String val) {
    final isActionButton = val == widget.actionButtonText;
    final actionButtonStyle =
    AppText.numPadTextStyle.copyWith(color: AppColor.darkerGreen, fontWeight: FontWeight.normal, fontSize: 16);
    Widget? child;
    if (val != 'C') {
      child = Text(val,
          textAlign: TextAlign.center,
          style: isActionButton
              ? actionButtonStyle
              : (enabled! ? AppText.numPadTextStyle : AppText.numPadTextStyle.copyWith(color: AppColor.semiGrey)));
    } else {
      if (widget.hasSecondaryActionButton! && _text.trim().isEmpty) {
        child = widget.secondaryActionWidget;
      } else {
        child = Icon(Icons.arrow_back, size: 24.0, color: enabled! ? AppColor.deepBlack : AppColor.semiGrey);
      }
    }

    Function(String value)? onKeyTap;
    if (val == widget.actionButtonText && widget.onActionbuttonPressed != null) {
      onKeyTap = (_) => widget.onActionbuttonPressed!();
    } else if (val == 'C' &&
        widget.hasSecondaryActionButton! &&
        widget.onSecondaryActionButtonPressed != null &&
        _text.trim().isEmpty) {
      onKeyTap = (_) => widget.onSecondaryActionButtonPressed!();
    } else {
      onKeyTap = widget.enabled! ? onKeyTapped : null;
    }

    /*return _KeyItem(
      value: val,
      child: (val != 'C')
          ? Text(val,
              textAlign: TextAlign.center,
              style: isActionButton
                  ? actionButtonStyle
                  : (enabled ? AppText.numPadTextStyle : AppText.numPadTextStyle.copyWith(color: AppColor.semiGrey)))
          : Icon(Icons.arrow_back, size: 24.0, color: enabled ? AppColor.deepBlack : AppColor.semiGrey),
      onKeyTap: (val == widget.actionButtonText && widget.onActionbuttonPressed != null)
          ? (_) => widget.onActionbuttonPressed()
          : (enabled ? onKeyTapped : null),
    );*/
    return _KeyItem(
      value: val,
      child: child,
      onKeyTap: onKeyTap,
    );
  }

  Expanded buildRow(List<String> items) {
    return Expanded(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[buildKeyItem(items[0]), buildKeyItem(items[1]), buildKeyItem(items[2])]));
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Container(child: buildRow(['1', '2', '3'])),
      Container(child: buildRow(['4', '5', '6'])),
      Container(child: buildRow(['7', '8', '9'])),
      Container(child: buildRow([widget.actionButtonText ?? '', '0', 'C']))
    ]);
  }
}

class _KeyItem extends StatelessWidget {
  final Widget? child;
  final String value;
  final Function(String value)? onKeyTap;

  const _KeyItem({required this.child, required this.value, this.onKeyTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkResponse(
            radius: 30,
            splashColor: AppColor.brightGreen,
            highlightColor: Colors.white,
            onTap: onKeyTap != null ? () => onKeyTap!(value) : null,
            child: Container(alignment: Alignment.center, child: child)));
  }
}
