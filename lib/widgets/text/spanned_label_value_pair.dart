
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/widgets/text/label_text.dart';

class SpannedLabelValuePair extends StatelessWidget {
  final String labelText;
  final List<Widget>? values;
  final EdgeInsets? padding;

  const SpannedLabelValuePair({
    required this.labelText,
    this.values,
    this.padding
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabelText(labelText),
              _buildBody(context, values!, padding: padding),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context, List<Widget> values, {EdgeInsets? padding}) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: values,
      ),
    );
  }
}