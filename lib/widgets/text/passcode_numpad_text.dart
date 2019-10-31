import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/text.dart';

typedef Callback = void Function(String value);

class PasscodeNumPadText extends StatefulWidget {
  final Callback onChange;
  final bool clearOnLongPress;
  final int textLengthLimit;
  final String startNumPadText;
  final bool needNumPadTextUpdate;
  final bool noTextCache;
  final Callback onKey;
  final String actionButtonText;
  final VoidCallback onActionbuttonPressed;

  const PasscodeNumPadText({
    @required this.onChange,
    this.clearOnLongPress = false,
    this.textLengthLimit = 0,
    this.startNumPadText = '',
    this.needNumPadTextUpdate = false,
    this.noTextCache = false,
    this.onKey,
    this.actionButtonText,
    this.onActionbuttonPressed,
  });

  @override
  _PasscodeNumPadTextState createState() => _PasscodeNumPadTextState();
}

class _PasscodeNumPadTextState extends State<PasscodeNumPadText> {
  String _text = '';

  bool _checkPressedClear(String key) {
    if (key != 'C') {
      return false;
    }

    if (_text.length > 1) {
      _text = _text.substring(0, _text.length - 1);
    } else {
      _text = '0';
    }

    return true;
  }

  bool _checkPressedKey(String key) {
    if (!'0123456789'.contains(key)) {
      return false;
    }

    if (_text == '0') {
      if (key == '0') {
        _text = '0.';
      } else if (key != '.') {
        _text = '';
      }
    }

    if (widget.textLengthLimit > 0 && (_text + key).length > widget.textLengthLimit) {
      return false;
    }
    _text += key;
    return true;
  }

  void onKeyTapped(String key) {
    if (widget.noTextCache && widget.onKey != null) {
      widget.onKey(key);
      return;
    }

    if (widget.needNumPadTextUpdate) {
      _text = widget.startNumPadText;
    }

    if (!_checkPressedClear(key)) {
      if (!_checkPressedKey(key)) {
        return;
      }
    }

    widget.onChange(_text);
  }

  void onKeyLongPressed(String key) {
    if (key == 'C' && widget.clearOnLongPress) {
      _text = '';
      widget.onChange(_text);
    }
  }

  Widget buildKeyItem(String val) {
    final isActionButton = val == widget.actionButtonText;
    final actionButtonStyle =
        AppText.numPadTextStyle.copyWith(color: AppColor.darkerGreen, fontWeight: FontWeight.normal, fontSize: 16);
    return KeyItem(
      value: val,
      child: (val != 'C')
          ? Text(val, textAlign: TextAlign.center, style: isActionButton ? actionButtonStyle : AppText.numPadTextStyle)
          : const Icon(Icons.arrow_back, size: 24.0, color: AppColor.deepBlack),
      onKeyTap: onKeyTapped,
      onKeyLongPress: onKeyLongPressed,
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

class KeyItem extends StatelessWidget {
  final Widget child;
  final String value;
  final Function(String value) onKeyTap;
  final Function(String value) onKeyLongPress;

  const KeyItem({@required this.child, this.value, this.onKeyTap, this.onKeyLongPress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkResponse(
            radius: 30,
            splashColor: AppColor.brightGreen,
            highlightColor: Colors.white,
            onLongPress: () => onKeyLongPress(value),
            onTap: () => onKeyTap(value),
            child: Container(alignment: Alignment.center, child: child)));
  }
}
