import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/text.dart';

typedef Callback = void Function(String value);

class NumPadText extends StatefulWidget {
  final Callback onChange;
  final int decimalPlaces;
  final bool clearOnLongPress;
  final int textLengthLimit;
  final String startNumPadText;
  final bool needNumPadTextUpdate;

  const NumPadText(
      {@required this.onChange,
      this.clearOnLongPress = false,
      this.textLengthLimit = 0,
      this.startNumPadText = '',
      this.needNumPadTextUpdate = false,
      this.decimalPlaces});

  @override
  _NumPadTextState createState() => _NumPadTextState();
}

class _NumPadTextState extends State<NumPadText> {
  String _text = '';

  bool alreadyHasADot(String key, String result) {
    return key == '.' && result.contains('.');
  }

  bool shouldRestrictDecimalPlaces(String result) {
    return widget.decimalPlaces != null &&
        result.contains('.') &&
        result.substring(result.indexOf('.')).length > widget.decimalPlaces + 1;
  }

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
    if (!'0123456789.'.contains(key)) {
      return false;
    }

    if (_text == '0') {
      if (key == '0') {
        _text = '0.';
      } else if (key != '.') {
        _text = '';
      }
    }

    if (alreadyHasADot(key, _text)) {
      return false;
    }
    if (widget.textLengthLimit > 0 && (_text + key).length > widget.textLengthLimit) {
      return false;
    }
    _text += key;
    return true;
  }

  void onKeyTapped(String key) {
    if (widget.needNumPadTextUpdate) {
      _text = widget.startNumPadText;
    }

    if (!_checkPressedClear(key)) {
      if (!_checkPressedKey(key)) {
        return;
      }
    }

    if (shouldRestrictDecimalPlaces(_text)) {
      _text = _text.substring(0, _text.length - 1);
    }
    widget.onChange(_text);
  }

  void onKeyLongPressed(String key) {
    if (key == 'C' && widget.clearOnLongPress) {
      _text = '';
      widget.onChange(_text);
    }
  }

  KeyItem buildKeyItem(String val) {
    return KeyItem(
      value: val,
      child: (val != 'C')
          ? Text(val,
              textAlign: TextAlign.center, style: AppText.numPadTextStyle)
          : const Icon(Icons.arrow_back, size: 24.0, color: AppColor.deepBlack),
      onKeyTap: onKeyTapped,
      onKeyLongPress: onKeyLongPressed,
    );
  }

  Expanded buildRow(List<String> items) {
    return Expanded(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
          buildKeyItem(items[0]),
          buildKeyItem(items[1]),
          buildKeyItem(items[2])
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Container(child: buildRow(['1', '2', '3'])),
      Container(child: buildRow(['4', '5', '6'])),
      Container(child: buildRow(['7', '8', '9'])),
      Container(child: buildRow(['.', '0', 'C']))
    ]);
  }
}

class KeyItem extends StatelessWidget {
  final Widget child;
  final String value;
  final Function(String value) onKeyTap;
  final Function(String value) onKeyLongPress;

  const KeyItem(
      {@required this.child, this.value, this.onKeyTap, this.onKeyLongPress});

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
