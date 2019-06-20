import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_storybook/expandable_story.dart';
import 'package:flutter_storybook/prop_updater/double_prop_updater.dart';
import 'package:flutter_storybook/props_explorer.dart';
import 'package:flutter_ui_kit/widgets/card.dart';
import 'package:flutter_ui_kit/widgets/text_button.dart';

class AppCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _emptyCardStory(),
            _dialogCardStory(),
          ],
        ),
      ),
    );
  }
  Widget _emptyCardStory() {
    return ExpandableStory(
      title: 'Empty Card',
      child: PropsExplorer(
        initialProps: const <String, dynamic>{
          'elevation': 2.0,
          'margin': 15.0,
          'borderRadius': 4.0,
        },
        formBuilder: (context, props, updateProp) {
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              DoublePropUpdater(
                  props: props,
                  updateProp: updateProp,
                  propKey: 'elevation',
                  min: 1,
                  max: 4
              ),
              DoublePropUpdater(
                  props: props,
                  updateProp: updateProp,
                  propKey: 'margin',
                  min: 0,
                  max: 20
              ),
              DoublePropUpdater(
                  props: props,
                  updateProp: updateProp,
                  propKey: 'borderRadius',
                  min: 0,
                  max: 20
              )
            ],
          );
        },
        widgetBuilder: (context, props) {
          final double elevation = props['elevation'];
          final double margin = props['margin'];
          final double borderRadius = props['borderRadius'];

          return AppCard(
            color: AppColor.deepWhite,
            elevation: elevation.toInt(),
            margin: EdgeInsets.all(margin),
            borderRadius: borderRadius,
            child: Container(
              width: 140,
              height: 140,
            ),
          );
        },
      ),
    );
  }


  Widget _dialogCardStory() {
    return ExpandableStory(
      title: 'Sample Card',
      child: PropsExplorer(
      initialProps: const <String, dynamic>{
        'elevation': 2.0,
        'margin': 15.0,
        'borderRadius': 4.0,
      },
      formBuilder: (context, props, updateProp) {
        return ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            DoublePropUpdater(
              props: props,
              updateProp: updateProp,
              propKey: 'elevation',
              min: 1,
              max: 4
            ),
            DoublePropUpdater(
              props: props,
              updateProp: updateProp,
              propKey: 'margin',
              min: 0,
              max: 20
            ),
            DoublePropUpdater(
              props: props,
              updateProp: updateProp,
              propKey: 'borderRadius',
              min: 0,
              max: 20
            )
          ],
        );
      },
      widgetBuilder: (context, props) {
        final double elevation = props['elevation'];
        final double margin = props['margin'];
        final double borderRadius = props['borderRadius'];

        return AppCard(
          color: AppColor.deepWhite,
          elevation: elevation.toInt(),
          margin: EdgeInsets.all(margin),
          borderRadius: borderRadius,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.album),
                title: Text('The Enchanted Nightingale'),
                subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
              ),
              ButtonTheme.bar(
                child: ButtonBar(
                  children: <Widget>[
                    TextButton(
                      'BUY TICKETS',
                      onPressed: (){},
                    ),
                    TextButton(
                      'LISTEN',
                      onPressed: (){},
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ),
    );
  }
}
