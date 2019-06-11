import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/text.dart';

typedef Callback = void Function(String value);

class TimeFrameSelector extends StatefulWidget {
  final Callback onChange;

  const TimeFrameSelector({Key key, this.onChange}) : super(key: key);

  @override
  _TimeFrameSelectorWidgetState createState() => _TimeFrameSelectorWidgetState();
}

class _TimeFrameSelectorWidgetState extends State<TimeFrameSelector> {
  String _periodValue = '1H';

  void _onPressedPeriod(String period) {
    setState(() {
      _periodValue = period;
      widget.onChange(_periodValue);
    });
  }

  Expanded _buildItem(String period) {
    final checkedButton = RaisedButton(
      padding: const EdgeInsets.all(0.0) ,
      child: Text(
        period ,
        style: AppText.graphTextStyle.copyWith(color: AppColor.deepWhite) ,
      ) ,
      highlightColor: AppColor.darkerGreen ,
      onPressed: () {
        _onPressedPeriod(period);
      }
    );

    final uncheckedButton = FlatButton(
      padding: const EdgeInsets.all(0.0) ,
      child: Text(
        period ,
        style: AppText.graphTextStyle ,
      ) ,
      onPressed: () {
        _onPressedPeriod(period);
      }
    );

    return Expanded(
      flex: 1 ,
      child: Container(
      height: 22.0 ,
      child: (_periodValue == period) ? checkedButton : uncheckedButton
      )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.center ,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
      children: <Widget>[
        _buildItem('1H'),
        _buildItem('1D'),
        _buildItem('1W'),
        _buildItem('1M'),
        _buildItem('1Y'),
        _buildItem('5Y')]
    );
  }
}
