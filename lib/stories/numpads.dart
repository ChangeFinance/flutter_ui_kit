import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_kit/story_book/expandable_story.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/bool_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/int_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/props_explorer.dart';
import 'package:flutter_ui_kit/text.dart';
import 'package:flutter_ui_kit/widgets.dart';
import 'package:flutter_ui_kit/widgets/passcode/passcode_numpad.dart';
import 'package:flutter_ui_kit/widgets/text/numpad_text.dart';

import '../color.dart';

class NumPads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _numPadStory(),
          _passcodeNumpadStory(context)
        ],
      ),);
  }
}

Widget _passcodeNumpadStory(BuildContext context ) {
  final _textEditingController = TextEditingController();
  void onChangeTextField(String value) {
    _textEditingController.text = value;
  }

  return ExpandableStory(
      title: 'Passcode Numpad',
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              new Container(
                  width: 300.0,
                  child: new IgnorePointer(
                      child: Container(
                          alignment: Alignment.bottomRight,
                          padding: const EdgeInsets.all(30.0),
                          child: IgnorePointer(
                              child: TextField(
                                  keyboardType: TextInputType.number,
                                  autofocus: false,
                                  controller: _textEditingController,
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context)
                                      .textTheme
                                      .display2
                                      .copyWith(fontWeight: FontWeight.normal),
                                  decoration: InputDecoration.collapsed(
                                      hintText: '0',
                                      hintStyle: AppText.numPadTextStyle)))))),
              Container(
                  height: 240.0,
                  child: PasscodeNumpad(
                    onKey: onChangeTextField,
                    leftBottomKey: TextButton(
                      'Forgot?', onPressed: (){print('Forgot button');},
                    ),
                    rightBottomKey: IconButton(
                        splashColor: AppColor.brightGreen,
                        highlightColor: Colors.white,
                        icon: const Icon(Icons.info_outline, color: AppColor.brightGreen,),
                        onPressed: () {print('Icon Pressed');}),
                  ))
            ])
          );
}

Widget _numPadStory() {
  final _textEditingController = TextEditingController();
  void onChangeTextField(String value) {
    _textEditingController.text = value;
  }

  return ExpandableStory(
      title: 'Num Pad',
      child: PropsExplorer(
          initialProps: const <String, dynamic>{
            'decimalPlaces': 6,
            'clearOnLongPress': false,
            'textLengthLimit': 0,
          },
          formBuilder: (context, props, updateProp) {
            return ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  IntPropUpdater(
                    props: props,
                    updateProp: updateProp,
                    propKey: 'decimalPlaces',
                    hintText: 'Simulate decimal places',
                  ),
                  BoolPropUpdater(
                    props: props,
                    updateProp: updateProp,
                    propKey: 'clearOnLongPress',
                  ),
                  IntPropUpdater(
                    props: props,
                    updateProp: updateProp,
                    propKey: 'textLengthLimit',
                    hintText: 'Text Length limit (0 for no limit)',
                  )
                ]);
          },
          widgetBuilder: (context, props) {
            return Column(mainAxisSize: MainAxisSize.min, children: [
              new Container(
                  width: 300.0,
                  child: new IgnorePointer(
                      child: Container(
                          alignment: Alignment.bottomRight,
                          padding: const EdgeInsets.all(30.0),
                          child: IgnorePointer(
                              child: TextField(
                                  keyboardType: TextInputType.number,
                                  autofocus: false,
                                  controller: _textEditingController,
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context)
                                      .textTheme
                                      .display2
                                      .copyWith(fontWeight: FontWeight.normal),
                                  decoration: InputDecoration.collapsed(
                                      hintText: '0',
                                      hintStyle: AppText.numPadTextStyle)))))),
              Container(
                  height: 240.0,
                  child: NumPadText(
                    onChange: onChangeTextField,
                    decimalPlaces: props['decimalPlaces'],
                    clearOnLongPress: props['clearOnLongPress'],
                    textLengthLimit: props['textLengthLimit'],
                  ))
            ]);
          }));
}
