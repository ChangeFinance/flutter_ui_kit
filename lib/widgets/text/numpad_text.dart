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
    if (key == '.') {
      if (!result.contains('.')) {
        result += key;
      }
    } else if (key == 'C') {
      result = result.substring(0, result.length - 1);
    } else {
      result += key;
    }
    if (decimalPlaces != null && result.contains('.')
        && result.substring(result.indexOf('.')).length > decimalPlaces + 1) {
      result = result.substring(0, result.length - 1);
    }
    textEditingController.text = result;
  }

  KeyItem buildKeyItem(String val , TextStyle digitTextStyle) {
    return KeyItem(
        value: val ,
        child: (val != 'C')
            ? Text(val , textAlign: TextAlign.center , style: digitTextStyle)
            : const Icon(Icons.arrow_back , size: 24.0 , color: AppColor.deepBlack) ,
        onKeyTap: onKeyTapped
    );
  }

  Expanded buildRow(List<String> items) {
    final digitTextStyle = AppText.header2.copyWith(fontFamily: 'CircularPro-Book', fontWeight: FontWeight.normal);
    return Expanded(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildKeyItem(items[0], digitTextStyle),
              buildKeyItem(items[1], digitTextStyle),
              buildKeyItem(items[2], digitTextStyle)
            ]
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.bottomRight,
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildRow(['1', '2', '3']),
                buildRow(['4', '5', '6']),
                buildRow(['7', '8', '9']),
                buildRow(['.', '0', 'C'])
              ]
            )
          )
        ]
      )
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
      child: Material(
        type: MaterialType.transparency,
        child: InkResponse(
          radius: MediaQuery.of(context).size.height * 0.05 - 2,
          splashColor: AppColor.brightGreen,
          highlightColor: Colors.white,
          onTap: () => onKeyTap(value),
          child: Container(
            alignment: Alignment.center,
            child: child
          )
        )
      )
    );
  }
}
