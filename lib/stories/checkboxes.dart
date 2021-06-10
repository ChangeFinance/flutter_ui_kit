import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/story_book/expandable_story.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/bool_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/string_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/props_explorer.dart';
import 'package:flutter_ui_kit/widgets/custom_checkbox.dart';

class Checkboxes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _story()
          ],
        ),
      ),
    );
  }


  Widget _story() {
    return ExpandableStory(
      title: 'Simple Checkbox',
      child: PropsExplorer(
      initialProps: const <String, dynamic>{
        'label': 'Sample Checkbox',
        'errorText': '',
        'isChecked': true,
      },
      formBuilder: (context, props, updateProp) {
        return ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            StringPropUpdater(
              props: props,
              updateProp: updateProp,
              propKey: 'label'
            ),
            StringPropUpdater(
              props: props,
              updateProp: updateProp,
              propKey: 'errorText'
            ),
            BoolPropUpdater(
              props: props,
              updateProp: updateProp,
              propKey: 'isChecked'
            )
          ],
        );
      },
      widgetBuilder: (context, props) {
        final String label = props['label'];
        final String? errorText = props['errorText'];
        final bool? isChecked = props['isChecked'];

        return CustomCheckbox(
          isChecked: isChecked,
          onChanged: (isChecked){_showDialog(context, isChecked);},
          label: Text(label),
          errorText: errorText,
        );
      },
    ),
    );
  }

  void _showDialog(BuildContext context, bool chkState) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('You clicked checkbox'),
          content: new Text('isChecked: $chkState'),
          actions: <Widget>[
            new FlatButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
