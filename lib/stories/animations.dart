import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/animations/shaker.dart';
import 'package:flutter_ui_kit/story_book/expandable_story.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/int_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/props_explorer.dart';
import 'package:flutter_ui_kit/widgets.dart';

class Animations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const _ShakerStory(),
          ],
        ),
      ),
    );
  }
}

class _ShakerStory extends StatefulWidget {
  const _ShakerStory();

  @override
  __ShakerStoryState createState() => __ShakerStoryState();
}

class __ShakerStoryState extends State<_ShakerStory> {
  bool canShake = false;

  @override
  Widget build(BuildContext context) {
    return ExpandableStory(
      title: 'Shaker',
      child: PropsExplorer(
        initialProps: const <String, dynamic>{
          'durationMs': 400,
        },
        formBuilder: (context, props, updateProp) {
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              IntPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'durationMs',
              ),
            ],
          );
        },
        widgetBuilder: (context, props) {
          final int durationMs = props['durationMs'];

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Shaker(
                child: const Text('Tap the button to shake me!'),
                canShake: canShake,
                shakeDuration: Duration(milliseconds: durationMs),
              ),
              const SizedBox(height: 10),
              FilledButton(
                'Shake',
                onPressed: () {
                  setState(() {
                    canShake = !canShake;
                  });
                },
                fullWidth: false,
                narrow: true,
              )
            ],
          );
        },
      ),
    );
  }
}
