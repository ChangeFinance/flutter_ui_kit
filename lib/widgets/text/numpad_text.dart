import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';

class NumPadText extends StatelessWidget {

  final TextEditingController textEditingController;
  final int digitsAfterPoint;

  const NumPadText({
    @required this.textEditingController,
    this.digitsAfterPoint = -1
  });

  void onKeyTapped(String key) {
    var result = textEditingController.text;
    if (key == '.') {
      if (!result.contains('.')) {
        result += key;
      }
    } else if (key == 'C') {
      result = result.substring(0, result.length-1);
    } else {
      result += key;
    }
    if (digitsAfterPoint > 0 && result.contains('.')
        && result.substring(result.indexOf('.')).length > digitsAfterPoint + 1) {
      result = result.substring(0, result.length-1);
    }
    textEditingController.text = result;
  }

  KeyItem buildKeyItem(String val, TextStyle digitTextStyle) {
    return KeyItem(
      value: val,
      child: Text(
        val,
        textAlign: TextAlign.center,
        style: digitTextStyle
      ),
      onKeyTap: onKeyTapped
    );
  }

  @override
  Widget build(BuildContext context) {
    final digitTextStyle
      = Theme.of(context).textTheme.display2.copyWith(fontFamily: 'CircularPro-Book', fontWeight: FontWeight.normal, color: Colors.black, fontSize: 24.0);
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
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              buildKeyItem('1', digitTextStyle),
                              buildKeyItem('2', digitTextStyle),
                              buildKeyItem('3', digitTextStyle)
                            ]
                          )
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              buildKeyItem('4', digitTextStyle),
                              buildKeyItem('5', digitTextStyle),
                              buildKeyItem('6', digitTextStyle)
                            ]
                          )
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              buildKeyItem('7', digitTextStyle),
                              buildKeyItem('8', digitTextStyle),
                              buildKeyItem('9', digitTextStyle)
                            ]
                          )
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              buildKeyItem('.', digitTextStyle),
                              buildKeyItem('0', digitTextStyle),
                              KeyItem(
                                value: 'C',
                                child: const Icon(
                                  Icons.arrow_back,
                                  size: 24.0,
                                  color: AppColor.deepBlack,
                                ),
                                onKeyTap: onKeyTapped
                              )
                            ]
                          )
                        )
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
