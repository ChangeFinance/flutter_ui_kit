import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/text.dart';

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
            style: AppText.graphTextStyle.copyWith(color: AppColor.deepWhite) ,
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
              style: AppText.graphTextStyle ,
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
