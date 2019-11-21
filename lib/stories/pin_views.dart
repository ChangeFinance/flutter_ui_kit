import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/story_book/expandable_story.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/int_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/string_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/props_explorer.dart';
import 'package:flutter_ui_kit/widgets/pin_view.dart';

class PinViews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          _passcodeStory(),
        ],
      )),
    );
  }

  Widget _passcodeStory() {
    return ExpandableStory(
      title: 'Pinview',
      child: PropsExplorer(
        initialProps: const <String, dynamic>{
          'length': 4,
          'text': '3',
        },
        formBuilder: (context, props, updateProp) {
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              IntPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'length',
                hintText: 'Length',
              ),
              StringPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'text',
                hintText: 'Text',
              ),
            ],
          );
        },
        widgetBuilder: (context, props) {
          return Container(
            child: Center(
              child: PinView(props['length'], props['text']),
            ),
          );
        },
      ),
    );
  }
}
