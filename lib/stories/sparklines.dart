import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/story_book/expandable_story.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/bool_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/string_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/props_explorer.dart';
import 'package:flutter_ui_kit/widgets/periodline.dart';
import 'package:flutter_ui_kit/widgets/sparkline.dart';

math.Random random = new math.Random();

class SparkLines extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width ,
      child: SingleChildScrollView(
        child: _sparkLinesStory()
      )
    );
  }
}

Widget _sparkLinesStory() {

  final _keySpark = GlobalKey<SparkLineWidgetState>();

  List<double> _generateRandomData(int count) {
    final result = <double>[];
    for (var i = 0; i < count; i++) {
      result.add(random.nextDouble() * 10000);
    }
    return result;
  }

  void onChangeTextField(String value) {
    _keySpark.currentState.onRefresh(_generateRandomData(50));
  }

  return Container(
    child: SingleChildScrollView(
      child: ExpandableStory(
        title: 'Spark Line',
        child: PropsExplorer(
          initialProps: const <String, dynamic>{
            'enableMaxMin': true,
            'labelPrefix': '\$'
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
                    child: SparkLine(key: _keySpark, labelPrefix: props['labelPrefix'],enableMaxMin: props['enableMaxMin'])
                )
              ),
              Container(
                height:35.0,
                child: Center(
                  child: PeriodLine(onChange: onChangeTextField),
                )
              ),
            ]);
          }
        )
      )
    )
  );
}
