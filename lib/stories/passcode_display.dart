import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_kit/story_book/expandable_story.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/bool_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/int_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/props_explorer.dart';
import 'package:flutter_ui_kit/widgets/passcode/passcode_widget.dart';

class PasscodeDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _build(context),
        ],
      ),);
  }

  Widget _build(BuildContext context) {
    return ExpandableStory(
      title: 'Passcode Display',
      child: PropsExplorer(
        initialProps: const <String, dynamic>{
          'TotalNumber': 4,
          'FilledNumber': 1,
          'HasError': false,
        },
        formBuilder: (context, props, updateProp) {
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              IntPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'TotalNumber',
                hintText: 'Total Number of Dots',
              ),
              IntPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'FilledNumber',
                hintText: 'Filled Number of Dots',
              ),
              BoolPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'HasError',
              ),
            ],
          );
        },
        widgetBuilder: (context, props) {
          return PasscodeWidget(
            totalNumber: props['TotalNumber'],
            filledNumber: props['FilledNumber'],
            hasError: props['HasError'],
          );
        },
      ),
    );
  }
}
