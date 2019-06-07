import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';

const TextStyle textStyle12 = TextStyle(
    color: AppColor.deepBlack,
    fontSize: 12.0,
    fontStyle: FontStyle.normal,
    fontFamily: 'CircularPro-Book');

const TextStyle textStyle12w = TextStyle(
    color: AppColor.deepWhite,
    fontSize: 12.0,
    fontStyle: FontStyle.normal,
    fontFamily: 'CircularPro-Book');

const TextStyle textStyle15 = TextStyle(
    color: AppColor.deepBlack,
    fontSize: 15.0,
    fontStyle: FontStyle.normal,
    fontFamily: 'CircularPro-Book');

typedef Callback = void Function(String value);

class PeriodLine extends StatefulWidget {
  final Callback onChange;

  const PeriodLine({Key key, this.onChange}) : super(key: key);

  @override
  _PeriodLineWidgetState createState() => _PeriodLineWidgetState();
}

class _PeriodLineWidgetState extends State<PeriodLine> {
  String _periodLine = '1H';

  void _onPressedPeriod(String period) {
    setState(() {
      _periodLine = period;
      widget.onChange(_periodLine);
    });
  }

  Expanded getItem(String period) {
    if (_periodLine == period) 
      return Expanded(
      flex: 1 ,
      child: Container(
        height: 22.0 ,
        child: RaisedButton(
          padding: const EdgeInsets.all(0.0) ,
          child: Text(
            period ,
            style: textStyle12w ,
          ) ,
          highlightColor: AppColor.darkerGreen ,
          onPressed: () {
            _onPressedPeriod(period);
          } ,
        ) ,
      ) ,
    ); 
    return Expanded(
        flex: 1 ,
        child: Container(
          height: 22.0 ,
          child: FlatButton(
            padding: const EdgeInsets.all(0.0) ,
            child: Text(
              period ,
              style: textStyle12 ,
            ) ,
            onPressed: () {
              _onPressedPeriod(period);
            } ,
          ) ,
        ) ,
      );
  }
  
  @override
  Widget build(BuildContext context) {
    return new Row(
        crossAxisAlignment: CrossAxisAlignment.center ,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
        children: <Widget>[
          getItem('1H'),
          getItem('1D'),
          getItem('1W'),
          getItem('1M'),
          getItem('1Y'),
          getItem('5Y')
        ]);
  }
}
