import 'package:flutter_ui_kit/widgets.dart';
import 'package:flutter/material.dart';

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
