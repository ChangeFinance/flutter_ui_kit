import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/story_book/expandable_story.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/bool_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/int_prop_updater.dart';
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

  final _keySpark1 = GlobalKey<GraphWidgetState>();
  final _keySpark2 = GlobalKey<GraphWidgetState>();

  List<double> _generateRandomData(int count) {
    final result = <double>[];
    for (var i = 0; i < count/5; i++) {
      result.add(2 + random.nextDouble() * 3);
    }
    for (var i = 0; i < count/5; i++) {
      result.add(3 + random.nextDouble() * 3);
    }
    for (var i = 0; i < count/5; i++) {
      result.add(4 + random.nextDouble() * 3);
    }
    for (var i = 0; i < count/5; i++) {
      result.add(2 + random.nextDouble() * 3);
    }
    for (var i = 0; i < count/5; i++) {
      result.add(3 + random.nextDouble() * 3);
    }

    return result;
  }

  void onChangeTextField(String value) {
    final data = _generateRandomData(50);
    _keySpark1.currentState.onRefresh(data);
    _keySpark2.currentState.onRefresh(data);
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
                BoolPropUpdater(
                  props: props,
                  updateProp: updateProp,
                  propKey: 'enableSharp',
                ),
                IntPropUpdater(
                  props: props,
                  updateProp: updateProp,
                  propKey: 'countValues',
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
            final data = _generateRandomData(props['countValues']);
            return Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                height:180.0,
                child: Center(
                    child: Graph(
                        initData: data,
                        key: _keySpark1,
                        labelPrefix: props['labelPrefix'],
                        enableMaxMin: props['enableMaxMin'],
                        sharpCorners: props['enableSharp']
                    )
                )
              ),
              Container(
                  height:180.0,
                  child: Center(
                      child: Graph(
                          initData: data,
                          key: _keySpark2,
                          labelPrefix: props['labelPrefix'],
                          enableMaxMin: props['enableMaxMin'],
                          sharpCorners: !props['enableSharp']
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
