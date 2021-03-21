import 'package:flutter/material.dart';

@Deprecated('Use ChgStreamCheckboxField')
class StreamCheckboxField extends StatelessWidget {
  final Stream<bool> value;
  final ValueChanged<bool> onChanged;
  final Widget label;
  final double height;

  const StreamCheckboxField({
    this.value,
    this.onChanged,
    this.label,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      initialData: false,
      stream: value,
      builder: (context, snapshot) {
        return CheckboxField(
          value: snapshot.data,
          onChanged: onChanged,
          label: label,
          boxHeight: height,
          errorText: snapshot.error,
        );
      },
    );
  }
}

@Deprecated('Use ChgCheckboxField')
class CheckboxField extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Widget label;
  final String errorText;
  final double boxHeight;

  const CheckboxField({
    this.value,
    this.onChanged,
    this.label,
    this.errorText,
    this.boxHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: errorText == null
          ? <Widget>[
              buildCheckboxListTile(boxHeight),
            ]
          : <Widget>[
              buildCheckboxListTile(boxHeight),
              buildError(context),
            ],
    );
  }

  Widget buildError(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      constraints: const BoxConstraints.tightFor(width: double.infinity),
      child: Text.rich(
        TextSpan(
          text: errorText,
          style: TextStyle(color: theme.errorColor, fontSize: 12.0),
        ),
      ),
    );
  }

  Widget buildCheckboxListTile(double boxHeight) {
    double height;
    if (boxHeight == null) {
      height = 45.00;
    } else {
      height = boxHeight;
    }
    return Container(
      constraints: BoxConstraints.tightFor(height: height),
      child: CheckboxListTile(
        // ignore: avoid_bool_literals_in_conditional_expressions
        value: value ?? false,
        onChanged: onChanged,
        controlAffinity: ListTileControlAffinity.leading,
        title: label,
      ),
    );
  }
}

class ChgCheckboxField extends CheckboxField {
  const ChgCheckboxField({
    bool value,
    ValueChanged<bool> onChanged,
    Widget label,
    String errorText,
    double boxHeight,
  }) : super(
          value: value,
          onChanged: onChanged,
          label: label,
          errorText: errorText,
          boxHeight: boxHeight,
        );
}

class ChgStreamCheckboxField extends StreamCheckboxField {
  const ChgStreamCheckboxField({
    Stream<bool> value,
    ValueChanged<bool> onChanged,
    Widget label,
    double height,
  }) : super(
          value: value,
          onChanged: onChanged,
          label: label,
          height: height,
        );
}
