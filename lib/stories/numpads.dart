import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_kit/story_book/expandable_story.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/bool_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/int_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/string_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/props_explorer.dart';
import 'package:flutter_ui_kit/text.dart';
import 'package:flutter_ui_kit/widgets/text/numpad_text.dart';
import 'package:flutter_ui_kit/widgets/text/passcode_numpad_text.dart';

class NumPads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            _numPadStory(),
            _PasscodeNumpadStory(),
          ],
        )));
  }
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

class _PasscodeNumpadStory extends StatelessWidget {

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ExpandableStory(
        title: 'Passcode Numpad',
        child: PropsExplorer(
            initialProps: const <String, dynamic>{
              'textLengthLimit': 0,
              'actionButtonText': 'Action'
            },
            formBuilder: (context, props, updateProp) {
              return ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    IntPropUpdater(
                      props: props,
                      updateProp: updateProp,
                      propKey: 'textLengthLimit',
                      hintText: 'Text Length limit (0 for no limit)',
                    ),
                    StringPropUpdater(
                      props: props,
                      updateProp: updateProp,
                      propKey: 'actionButtonText',
                      hintText: 'Action button text',
                    ),
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
                    child: PasscodeNumPadText(
                      onChange: (String newVal) {
                        _textEditingController.text = newVal;
                        print('NEWVAL: $newVal');
                      },
                      textLengthLimit: props['textLengthLimit'],
                      actionButtonText: props['actionButtonText'],
                    ))
              ]);
            }));
  }
}
