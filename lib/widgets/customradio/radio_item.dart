import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ui_kit/widgets/customradio/radio_model.dart';

import '../../color.dart';

class RadioItem extends StatelessWidget {
  final RadioModel _item;

  const RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.only(top: 14.00),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
            height: 30.0,
            width: 30.0,
            child: new Center(
              child: _item.isSelected
                  ? const Icon(Icons.check, size: 20.0, color: AppColor.deepWhite)
                  : const Icon(Icons.check, size: 20.0,
                      color: AppColor.deepWhite),
            ),
            decoration: new BoxDecoration(
              color:
                  _item.isSelected ? AppColor.darkerGreen : Colors.transparent,
              border: new Border.all(
                  width: 1.0,
                  color: _item.isSelected ? AppColor.darkerGreen : AppColor.grey),
              shape: BoxShape.circle,
            ),
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
}
