import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/story_book/expandable_story.dart';
import 'package:flutter_ui_kit/story_book/props_explorer.dart';
import 'package:flutter_ui_kit/widgets/text/email.dart';

class Inputs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_emailStory()],
      ),
    );
  }

  Widget _emailStory() {
    return ExpandableStory(
      title: 'Email',
      child: PropsExplorer(
        initialProps: const <String, dynamic>{},
        formBuilder: (context, props, updateProp) {
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: const <Widget>[],
          );
        },
        widgetBuilder: (context, props) {
          return const Email();
        },
      ),
    );
  }
}
