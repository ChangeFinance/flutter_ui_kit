import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ui_kit/widgets/customradio/radio_model.dart';

import '../change_app_icons.dart';

class RadioItem extends StatelessWidget {
  final RadioModel _item;

  const RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.only(top: 14.00),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            height: 24.0,
            width: 24.0,
            child: _radio(_item.isSelected)
            ),
          new Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.00),
            child: new Row(children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(left: 10.00, right: 10.00),
                  child: _item.svgPicture),
              Padding(
                  padding: const EdgeInsets.only(left: 5.00),
                  child: Text(_item.text))
            ]),
          ),
        ],
      ),
    );
  }

  Widget _radio(bool isSelected) {
    return isSelected
        ? Container(child: ChangeAppIcons.radio_checked)
        : ChangeAppIcons.radio_unchecked;
  }
}
