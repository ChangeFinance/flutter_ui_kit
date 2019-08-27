import 'package:flutter_ui_kit/story_book/expandable_story.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/bool_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/int_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/string_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/props_explorer.dart';
import 'package:flutter_ui_kit/widgets.dart';
import 'package:flutter_ui_kit/widgets/filled_button.dart';
import 'package:flutter_ui_kit/widgets/outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/widgets/text_button.dart';

class CustomLabelValue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const LabelValueEditableField(
            labelText: 'First Name',
            valueText: 'John',
            editable: true
          ),
          const LabelValueEditableField(
              labelText: 'Last Name',
              valueText: 'Doe',
              editable: false
          )
        ],
      ),
    );
  }
}
