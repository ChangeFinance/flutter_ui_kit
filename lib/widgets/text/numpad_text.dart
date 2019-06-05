import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/text.dart';

class NumPadText extends StatelessWidget {

  final TextEditingController textEditingController;
  final int decimalPlaces;

  const NumPadText({
    @required this.textEditingController,
    this.decimalPlaces
  });

  void onKeyTapped(String key) {
    var result = textEditingController.text;
    if ('0123456789.'.contains(key)) {
      if (key == '.' && result.contains('.'))
        return;
      result += key;
    } else if (key == 'C') {
      result = result.substring(0, result.length - 1);
    } else
      return;

    if (decimalPlaces != null && result.contains('.')
        && result.substring(result.indexOf('.')).length > decimalPlaces + 1) {
      result = result.substring(0, result.length - 1);
    }
    textEditingController.text = result;
  }

  KeyItem buildKeyItem(String val) {
    return KeyItem(
        value: val ,
        child: (val != 'C')
            ? Text(val , textAlign: TextAlign.center , style: AppText.body4)
            : const Icon(Icons.arrow_back , size: 24.0 , color: AppColor.deepBlack) ,
        onKeyTap: onKeyTapped
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
            ]
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: buildRow(['1', '2', '3'])
        ),
        Container(
          child: buildRow(['4', '5', '6'])
        ),
        Container(
          child: buildRow(['7', '8', '9'])
        ),
        Container(
          child: buildRow(['.', '0', 'C'])
      )]
    );
  }
}

class KeyItem extends StatelessWidget {

  final Widget child;
  final String value;
  final Function(String value) onKeyTap;
  const KeyItem({@required this.child,this.value,this.onKeyTap});

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    return Expanded(
      child: InkResponse(
        radius: 30,
        splashColor: AppColor.brightGreen,
        highlightColor: Colors.white,
        onTap: () => onKeyTap(value),
        child: Container(
          alignment: Alignment.center,
          child: child
        )
      )
    );
  }
}
