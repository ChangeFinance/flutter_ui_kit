import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/story_book/expandable_story.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/double_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/props_explorer.dart';
import 'package:flutter_ui_kit/widgets/bottom_green_progress_indicator.dart';

class ProgressIndicators extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _bottomGreenProgressIndicatorStory()
          ],
        ),
      )
    );
  }

  Widget _bottomGreenProgressIndicatorStory() {
    return ExpandableStory(
      title: 'Bottom Green Progress Indicator',
      child: PropsExplorer(
        initialProps: const <String, dynamic> {
          'progressIndicatorValue': 4.0,
          'roundedBorder': 0.0,
        },
        formBuilder: (context, props, updateProp) {
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              DoublePropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'progressIndicatorValue',
                min: 0.0,
                max: 10.0,
              ),
              DoublePropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'roundedBorder',
                min: 0.0,
                max: 10.0,
              ),
            ],
          );
        },
        widgetBuilder: (context, props) {
          final double progressIndicatorValue = props['progressIndicatorValue'];
          final double roundedBorder = props['roundedBorder'];

          return BottomGreenProgressIndicator(
            progressIndicatorValue: progressIndicatorValue,
            roundedBorder: roundedBorder,
          );
        }
      ),
    );
  }
}