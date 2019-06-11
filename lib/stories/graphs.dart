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
  final key = ValueKey(data);
  void onChangeTextField(String value) {
    _generateRandomData(1000);
  }

  return Container(
    child: SingleChildScrollView(
      child: ExpandableStory(
        title: 'Spark Line',
        child: PropsExplorer(
          initialProps: const <String, dynamic>{
            'enableMaxMin': true,
            'enableSharp': true,
            'labelPrefix': '€',
            'countValues': 10
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
                        key: key,
                        data: data,
                        labelPrefix: props['labelPrefix'],
                        enableMaxMin: props['enableMaxMin']
                    )
                )
              ),
              Container(
                height:35.0,
                child: Center(
                  child: TimeFrameSelector(onChange: onChangeTextField),
                )
              ),
            ]);
          }
        )
      )
    )
  );
}
