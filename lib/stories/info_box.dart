import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/story_book/expandable_story.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/string_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/props_explorer.dart';
import 'package:flutter_ui_kit/widgets/security_info_box.dart';

class InfoBoxes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(child: _story()));
  }
}

Widget _story() {
  return Container(
      child: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _securedInfoBoxStory(),
              ]
          )
      ));
}

Widget _securedInfoBoxStory() {
  return ExpandableStory(
      title: 'Security Info Box',
      child: PropsExplorer(
          initialProps: const <String, dynamic>{
            'assetName': 'assets/convert_is_secured.svg',
            'infoHeader': 'Your funds are stored securely',
            'infoBody': 'Change uses a combination of offline storage and multi-signature solutions to ensure that your cryptocurrency is protected.'
          },
          formBuilder: (context, props, updateProp) {
            return ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  StringPropUpdater(
                    props: props,
                    updateProp: updateProp,
                    propKey: 'infoHeader',
                  ),
                  StringPropUpdater(
                    props: props,
                    updateProp: updateProp,
                    propKey: 'infoBody',
                  ),
                ]);
          },
          widgetBuilder: (context, props) {
            return Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                  child: Center(
                    child: SecurityInfoBox(
                        props['assetName'],
                        props['infoHeader'],
                        props['infoBody']),
                  ))]);
          }));
}
