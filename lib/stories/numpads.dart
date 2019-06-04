import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_kit/story_book/expandable_story.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/int_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/props_explorer.dart';
import 'package:flutter_ui_kit/widgets/text/numpad_text.dart';

class NumPads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery
            .of(context)
            .size
            .width ,
        child: SingleChildScrollView(
            child: _numPadStory()
        )
    );
  }
}

Widget _numPadStory() {
  final _textEditingController = TextEditingController();
  return ExpandableStory(
    title: 'Num Pad',
    child: PropsExplorer(
      initialProps: const <String, dynamic>{
        'decimalPlaces': 6,
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
            )
          ]
        );
      },
      widgetBuilder: (context, props) {
        return Column(mainAxisSize: MainAxisSize.min, children: [
          new Container(
              child: ConstrainedBox(
                  constraints: const BoxConstraints.tightFor(width: 280.0),
                  child: new IgnorePointer(
                      child: Container(
                          alignment: Alignment.bottomRight,
                          padding: const EdgeInsets.all(30.0),
                          child: IgnorePointer(
                              child: TextField(
                                keyboardType: TextInputType.number,
                                autofocus: false,
                                controller: _textEditingController,
                                textAlign: TextAlign.right,
                                style: Theme.of(context).textTheme.display2.copyWith(fontWeight: FontWeight.normal),
                                decoration: InputDecoration.collapsed(
                                    hintText: '0',
                                    hintStyle: const TextStyle(color: Colors.black, fontSize: 24.0))
                              )
                          )
                      )
                  )
              )
          ),
          Center(child: NumPadText(textEditingController: _textEditingController, decimalPlaces: props['decimalPlaces']))
        ]);
      }
    )
  );
}