import 'package:flutter_ui_kit/widgets.dart';
import 'package:flutter/material.dart';

class CustomLabelValue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: const LabelValueEditableField(
            labelText: 'First Name',
            valueText: 'John',
            editable: true
        )
    );
  }
}
