import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/story_book/expandable_story.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/bool_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/string_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/props_explorer.dart';
import 'package:flutter_ui_kit/widgets/time_frame_selector.dart';
import 'package:flutter_ui_kit/widgets/graph.dart';

math.Random random = new math.Random();

class Graphs extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width ,
      child: SingleChildScrollView(
        child: _graphsStory()
      )
    );
  }
}

Widget _graphsStory() {

  List<double> _generateRandomData(int count) {
    final result = <double>[];
    for (var i = 0; i < count; i++) {
      result.add(random.nextDouble() * 10000);
    }
    return result;
  }
  final data = _generateRandomData(100);
  void onChangeTextField(String value) {
    _generateRandomData(1000);
  }

  return Container(
    child: SingleChildScrollView(
      child: ExpandableStory(
        title: 'Graph Line',
        child: PropsExplorer(
          initialProps: const <String, dynamic>{
            'enableMaxMin': true,
            'labelPrefix': '€',
            'enableGradient': true,
            'enableAutoColor': false,
            'showTimeFrameSelector': true

          },
          formBuilder: (context, props, updateProp) {
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                BoolPropUpdater(
                  props: props,
                  updateProp: updateProp,
                  propKey: 'enableMaxMin',
                ),
                BoolPropUpdater(
                  props: props,
                  updateProp: updateProp,
                  propKey: 'enableGradient',
                ),
                BoolPropUpdater(
                  props: props,
                  updateProp: updateProp,
                  propKey: 'enableAutoColor',
                ),
                BoolPropUpdater(
                  props: props,
                  updateProp: updateProp,
                  propKey: 'showTimeFrameSelector',
                ),
                StringPropUpdater(
                  props: props,
                  updateProp: updateProp,
                  propKey: 'labelPrefix',
                ),
              ]
            );
          },
          widgetBuilder: (context, props) {
            return Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                height:180.0,
                child: Center(
                    child: Graph(
                        data: data,
                        labelPrefix: props['labelPrefix'],
                        enableMaxMin: props['enableMaxMin'],
                        enableGradient: props['enableGradient'],
                        enableAutoColor: props['enableAutoColor'],
                    )
                )
              ),
              Container(
                height:35.0,
                child: Center(
                  child: props['showTimeFrameSelector'] ? TimeFrameSelector(onChange: onChangeTextField) : Container(),
                )
              ),
            ]);
          }
        )
      )
    )
  );
}
