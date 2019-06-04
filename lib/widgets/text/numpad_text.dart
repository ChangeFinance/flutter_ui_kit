import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';

class NumPadText extends StatefulWidget {

  final TextEditingController textEditingController;

  const NumPadText({
    @required this.textEditingController
  });

  @override
  _NumPadTextState createState() => _NumPadTextState();
}

class _NumPadTextState extends State<NumPadText> {
  static const Key _sevenKey = Key('seven');
  static const Key _eightKey = Key('eight');
  static const Key _nineKey = Key('nine');
  static const Key _fourKey = Key('four');
  static const Key _fiveKey = Key('five');
  static const Key _sixKey = Key('six');
  static const Key _oneKey = Key('one');
  static const Key _twoKey = Key('two');
  static const Key _threeKey = Key('three');
  static const Key _dotKey = Key('dot');
  static const Key _zeroKey = Key('zero');
  static const Key _clearKey = Key('clear');

  double height;
  double width;
  TextStyle digitTextStyle;

  void onKeyTapped(Key key) {
    var result = widget.textEditingController.text;
    setState(() {
      if (identical(_sevenKey, key)) {
        result += '7';
      } else if(identical(_eightKey, key)) {
        result += '8';
      } else if(identical(_nineKey, key)) {
        result += '9';
      } else if(identical(_fourKey, key)) {
        result += '4';
      } else if(identical(_fiveKey, key)) {
        result += '5';
      } else if(identical(_sixKey, key)) {
        result += '6';
      } else if(identical(_oneKey, key)) {
        result += '1';
      } else if(identical(_twoKey, key)) {
        result += '2';
      } else if(identical(_threeKey, key)) {
        result += '3';
      } else if(identical(_dotKey, key)) {
        if (!result.contains('.')) {
          result += '.';
        }
      } else if(identical(_zeroKey, key)) {
        result += '0';
      } else if(identical(_clearKey, key)) {
        result = result.substring(0, result.length-1);
      }
      if (result.contains('.') && result.substring(result.indexOf('.')).length > 7) {
        result = result.substring(0, result.length-1);
      }
      widget.textEditingController.text = result;
    });
  }

  KeyItem buildKeyItem(String val, Key key) {
    return KeyItem(
      key: key,
      child: Text(
        val,
        textAlign: TextAlign.center,
        style: digitTextStyle
      ),
      onKeyTap: onKeyTapped,
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    debugPrint('Width :: $width and Height :: $height');
    digitTextStyle = Theme.of(context).textTheme.display2.copyWith(fontFamily: 'CircularPro-Book', fontWeight: FontWeight.normal, color: Colors.black, fontSize: 24.0);
    return Material(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.bottomRight,
                color: Colors.white,
                  height: height/2.5,
                  width: width/1.2,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              buildKeyItem('1',_oneKey),
                              buildKeyItem('2',_twoKey),
                              buildKeyItem('3',_threeKey),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              buildKeyItem('4',_fourKey),
                              buildKeyItem('5',_fiveKey),
                              buildKeyItem('6',_sixKey),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              buildKeyItem('7', _sevenKey),
                              buildKeyItem('8',_eightKey),
                              buildKeyItem('9',_nineKey),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              buildKeyItem('.',_dotKey),
                              buildKeyItem('0',_zeroKey),
                              KeyItem(
                                key: _clearKey,
                                child: const Icon(
                                  Icons.arrow_back,
                                  size: 24.0,
                                  color: AppColor.deepBlack,
                                ),
                                onKeyTap: onKeyTapped,
                              ),
                            ],
                          ),
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
  @override
  // ignore: overridden_fields
  final Key key;
  final Function(Key key) onKeyTap;

  const KeyItem({@required this.child,this.key,this.onKeyTap});

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    return Expanded(
      child: Material(
        type: MaterialType.transparency,
        child: InkResponse(
          radius: 30.0,
          splashColor: AppColor.brightGreen,
          highlightColor: Colors.white,
          onTap: () => onKeyTap(key),
          child: Container(
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }
}
