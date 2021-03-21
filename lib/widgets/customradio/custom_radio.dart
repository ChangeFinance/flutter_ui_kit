import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/widgets/customradio/radio_item.dart';
import 'package:flutter_ui_kit/widgets/customradio/radio_model.dart';
import 'package:flutter_ui_kit/widgets/filled_button.dart';

class CustomRadio extends StatefulWidget {
  final List<RadioModel> radioElements;
  const CustomRadio({this.radioElements});

  @override
  CustomRadioState createState() {
    return new CustomRadioState(radioElements: radioElements);
  }

  static List<RadioModel> availableRadioModels() {
    final sampleRadioElements = <RadioModel>[];
    sampleRadioElements.add(new RadioModel('Euro',
        textShortform: 'EUR',
        isSelected: false,
        svgPicture:
            SvgPicture.asset('assets/euro.svg', height: 30.0, width: 30.0)));
    sampleRadioElements.add(new RadioModel('Bitcoin',
        textShortform: 'BTC',
        isSelected: false,
        svgPicture: SvgPicture.asset('assets/bitcoin_colourful.svg',
            height: 30.0, width: 30.0)));
    return sampleRadioElements;
  }
}

class CustomRadioState extends State<CustomRadio> {
  List<RadioModel> radioElements;
  CustomRadioState({this.radioElements});
  String selectedRadioModel;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView.builder(
        itemCount: radioElements.length,
        itemBuilder: (BuildContext context, int index) {
          return new InkWell(
            splashColor: AppColor.darkerGreen,
            onTap: () {
              setState(() {
                radioElements.forEach((element) => element.isSelected = false);
                radioElements[index].isSelected = true;
                selectedRadioModel = radioElements[index].textShortform;
              });
            },
            child: new RadioItem(radioElements[index]),
          );
        },
      ),
      floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: new ChgFilledButton(
            'Next',
            fullWidth: true,
            onPressed: () {
              print('You selected: $selectedRadioModel');
            },
          )),
    );
  }
}
