import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/story_book/expandable_story.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/bool_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/double_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/props_explorer.dart';
import 'package:flutter_ui_kit/widgets/simple_progress_indicator.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/dropdown_prop_updater.dart';

class ProgressIndicators extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Column(
        children: <Widget>[_simpleProgressIndicatorStory()],
      ),
    ));
  }

  Widget _simpleProgressIndicatorStory() {
    final colorList = ['Yellow', 'Red', 'Blue', 'Green'];

    return ExpandableStory(
      title: 'Bottom Green Progress Indicator',
      child: PropsExplorer(
          initialProps: <String, dynamic>{
            'percentageFilled': 4.0,
            'roundedBorder': 0.0,
            'height': 6.0,
            'background': false,
            'color': colorList[0],
          },
          formBuilder: (context, props, updateProp) {
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                DoublePropUpdater(
                  props: props,
                  updateProp: updateProp,
                  propKey: 'percentageFilled',
                  min: 0.0,
                  max: 100.0,
                ),
                DoublePropUpdater(
                  props: props,
                  updateProp: updateProp,
                  propKey: 'roundedBorder',
                  min: 0.0,
                  max: 10.0,
                ),
                DoublePropUpdater(
                  props: props,
                  updateProp: updateProp,
                  propKey: 'height',
                  min: 0.0,
                  max: 100.0,
                ),
                BoolPropUpdater(
                  props: props,
                  updateProp: updateProp,
                  propKey: 'background',
                ),
                DropdownPropUpdater(
                  props: props,
                  updateProp: updateProp,
                  propKey: 'color',
                  options: colorList,
                ),
              ],
            );
          },
          widgetBuilder: (context, props) {
            final double percentageFilled =
                props['percentageFilled'];
            final double? roundedBorder = props['roundedBorder'];
            final double? height = props['height'];
            final bool? background = props['background'];
            final String? selectedOption = props['color'];

            return Container(
              padding: const EdgeInsets.only(right: 20.0, left: 20.0),
              child: SimpleProgressIndicator(
                percentageFilled: percentageFilled,
                roundedBorder: roundedBorder,
                height: height,
                background: background,
                color: optionToColor(selectedOption),
              ),
            );
          }),
    );
  }

  Color? optionToColor(String? optionSelected) {
    switch (optionSelected) {
      case 'Yellow':
        {
          return Colors.orange[400];
        }

      case 'Blue':
        {
          return Colors.blue[300];
        }

      case 'Green':
        {
          return Colors.greenAccent;
        }

      case 'Red':
        {
          return Colors.red[300];
        }

      default:
        {
          return Colors.red[200];
        }
    }
  }
}
