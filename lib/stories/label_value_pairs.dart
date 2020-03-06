import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/story_book/expandable_story.dart';
import 'package:flutter_ui_kit/story_book/props_explorer.dart';
import 'package:flutter_ui_kit/widgets/text/spanned_label_value_pair.dart';

class LabelValuePairs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _spannedLabelValuePairStory(),
        ],
      ),
    );
  }

  Widget _spannedLabelValuePairStory() {
    return ExpandableStory(
      title: 'Spanned Label value pair',
      child: PropsExplorer(
        initialProps: const <String, dynamic>{},
        formBuilder: (ctx, props, updateProp) => ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[Container()],
        ),
        widgetBuilder: (ctx, props) {
          return const SpannedLabelValuePair(
            labelText: 'Profit / Price movement',
            values: <Widget>[
              const Text('0.03'),
              const Text('/'),
              const Text('-0.28%'),
            ],
          );
        },
      ),
    );
  }
}
