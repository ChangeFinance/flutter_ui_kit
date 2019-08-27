import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/story_book/expandable_story.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/list_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/props_explorer.dart';
import 'package:flutter_ui_kit/widgets/switcher.dart';

class Switchers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(child: _switchersStory()));
  }

  Widget _switchersStory() {
    // ignore: prefer_function_declarations_over_variables
    final listToTextConverter = <String>(List<String> list) => list.join(',');
    // ignore: prefer_function_declarations_over_variables
    final textToListConverter = (String text) => text.split(',');
    return Container(
        child: SingleChildScrollView(
            child: ExpandableStory(
                title: 'Switcher',
                child: PropsExplorer(
                    initialProps: const <String, dynamic>{
                      'buttonLabels': ['BTC', 'EUR'],
                      'values': ['₿0.0147', '€50'],
                    },
                    formBuilder: (context, props, updateProp) {
                      return ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: <Widget>[
                            ListPropUpdater<String>(
                              props: props,
                              updateProp: updateProp,
                              propKey: 'buttonLabels',
                              listToTextConverter: listToTextConverter,
                              textToListConverter: textToListConverter,
                            ),
                            ListPropUpdater<String>(
                              props: props,
                              updateProp: updateProp,
                              propKey: 'values',
                              listToTextConverter: listToTextConverter,
                              textToListConverter: textToListConverter,
                            ),
                          ]);
                    },
                    widgetBuilder: (context, props) {
                      final List<String> labels = props['buttonLabels'];
                      final List<String> values = props['values'];
                      return Switcher(
                        buttonLabels: labels,
                        values: values,
                      );
                    }))));
  }
}
