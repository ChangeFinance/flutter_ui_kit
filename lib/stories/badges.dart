import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/story_book/expandable_story.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/double_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/dropdown_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/string_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/props_explorer.dart';
import 'package:flutter_ui_kit/widgets/badge/badge.dart';
import 'package:flutter_ui_kit/widgets/badge/multivalue_badge.dart';

import '../color.dart';

const _colorList = ['Red', 'Green'];

Color _optionToColor(String optionSelected) {
  switch (optionSelected) {
    case 'Red':
      return AppColor.red;
    default:
      return AppColor.green;
  }
}

class Badges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(child: _badgesStory()));
  }
}

Widget _badgesStory() {
  return Container(
      child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _simpleBadgeStory(),
              _multiValueBadgeStory()
            ]
          )
  ));
}

Widget _simpleBadgeStory() {
  return ExpandableStory(
      title: 'Simple Badge',
      child: PropsExplorer(
          initialProps: const <String, dynamic>{
            'text': '\$1234.56',
            'minWidth': 80.0,
            'bgColor': 'Green'
          },
          formBuilder: (context, props, updateProp) {
            return ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  StringPropUpdater(
                    props: props,
                    updateProp: updateProp,
                    propKey: 'text',
                  ),
                  DoublePropUpdater(
                      props: props,
                      updateProp: updateProp,
                      propKey: 'minWidth',
                      min: 60.0,
                      max: 160.0),
                  DropdownPropUpdater(
                    props: props,
                    updateProp: updateProp,
                    propKey: 'bgColor',
                    options: _colorList,
                  )
                ]);
          },
          widgetBuilder: (context, props) {
            return Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                  child: Center(
                      child: Badge(
                        props['text'],
                        minWidth: props['minWidth'],
                        bgColor: _optionToColor(props['bgColor']),
                      ))),
            ]);
          }));
}

Widget _multiValueBadgeStory() {
  return ExpandableStory(
      title: 'MultiValue Badge',
      child: PropsExplorer(
          initialProps: const <String, dynamic>{
            'texts': ['\$1234.56', '+1.23%'],
            'minWidth': 120.0,
            'bgColor': 'Green'
          },
          formBuilder: (context, props, updateProp) {
            return ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  DoublePropUpdater(
                      props: props,
                      updateProp: updateProp,
                      propKey: 'minWidth',
                      min: 60.0,
                      max: 160.0),
                  DropdownPropUpdater(
                    props: props,
                    updateProp: updateProp,
                    propKey: 'bgColor',
                    options: _colorList,
                  )
                ]);
          },
          widgetBuilder: (context, props) {
            return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: MultiValueBadge(
                        props['texts'],
                        minWidth: props['minWidth'],
                        bgColor: _optionToColor(props['bgColor']),
                      )),
            ]);
          }));
}

