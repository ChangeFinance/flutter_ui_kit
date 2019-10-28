import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/text.dart';
import 'package:flutter_ui_kit/widgets/text/numpad_text.dart';

typedef Callback = void Function(String value);

class PasscodeNumpad extends StatelessWidget {
  final Callback onKey;
  final Widget leftBottomKey;
  final Widget rightBottomKey;

  const PasscodeNumpad(
      {@required this.onKey,
        this.leftBottomKey,
        this.rightBottomKey
      });

  Widget buildKeyItem(String val) {
    if (val == 'R') {
      return rightBottomKey != null ? Expanded(child: rightBottomKey) : KeyItem(
        value: val,
        child: const Icon(Icons.arrow_back, size: 24.0, color: AppColor.deepBlack),
        onKeyTap: onKey,
      );
    }

    if (val == 'L') {
      return leftBottomKey != null ? Expanded(child: leftBottomKey) : Expanded(
          child: Container(height: 30, width: 30,)
      );
    }

    return KeyItem(
      value: val,
      child: Text(val, textAlign: TextAlign.center, style: AppText.numPadTextStyle),
      onKeyTap: onKey,
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
      Container(child: buildRow(['L', '0', 'R']))
    ]);
  }
}
