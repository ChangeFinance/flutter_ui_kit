import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_kit/color.dart';


class CustomRadio extends StatefulWidget {
  @override
  CustomRadioState createState() {
    return new CustomRadioState();
  }
}

class CustomRadioState extends State<CustomRadio> {
  List<RadioModel> sampleData = <RadioModel>[];

  @override
  void initState() {
    super.initState();
    sampleData.add(new RadioModel( 'Euro', isSelected: false, svgPicture: SvgPicture.asset('assets/euro.svg', height: 45.0, width: 45.0)));
    sampleData.add(new RadioModel( 'Bitcoin',isSelected: false, svgPicture: SvgPicture.asset('assets/bitcoin_colourful.svg', height: 45.0, width: 45.0)));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView.builder(
        itemCount: sampleData.length,
        itemBuilder: (BuildContext context, int index) {
          return new InkWell(
            splashColor: AppColor.darkerGreen,
            onTap: () {
              setState(() {
                sampleData.forEach((element) => element.isSelected = false);
                sampleData[index].isSelected = true;
              });
            },
            child: new RadioItem(sampleData[index]),
          );
        },
      ),
    );
  }
}

class RadioItem extends StatelessWidget {

  final RadioModel _item;

  const RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.all(15.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
            height: 50.0,
            width: 50.0,
            child: new Center(
              child: _item.isSelected ? const Icon(Icons.check, size: 30.0, color: Colors.white) : const Icon(Icons.check_box_outline_blank, color: AppColor.deepWhite),
            ),
            decoration: new BoxDecoration(
              color: _item.isSelected
                  ? AppColor.darkerGreen
                  : Colors.transparent,
              border: new Border.all(
                  width: 1.0,
                  color: _item.isSelected
                      ? AppColor.darkerGreen
                      : Colors.grey),
              shape: BoxShape.circle,
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(left:10.0, right: 10.00),
            child: new Row(children: <Widget>[ Padding(padding: const EdgeInsets.only(left: 10.00, right: 10.00),child: _item.svgPicture), Padding(padding: const EdgeInsets.only(left: 20.00),child: Text(_item.text))]),
          ),
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String text;
  SvgPicture svgPicture;
  RadioModel(this.text, {this.svgPicture, this.isSelected});
}