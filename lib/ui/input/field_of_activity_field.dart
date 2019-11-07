import 'dart:async';

import 'package:changeapp_common/wallet/sourceOfFunds/source_of_funds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/ui/input/text_field.dart';
import 'package:flutter_ui_kit/ui/text/body.dart';
import 'package:flutter_ui_kit/ui/text/heading.dart';

class StreamFieldOfActivityField extends StatefulWidget {
  final Stream<String> value;
  final ValueChanged onChanged;
  final String labelText;

  const StreamFieldOfActivityField(
      {Key key, this.value, this.onChanged, this.labelText}): super(key: key);

  @override
  FieldOfActivityFieldState createState() {
    return new FieldOfActivityFieldState();
  }
}

class FieldOfActivityFieldState extends State<StreamFieldOfActivityField> {
  final FocusNode _focus = new FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocus);
  }

  void _onFocus() async {
    if (_focus.hasFocus) {
      final country = await showDialog<String>(
          context: context,
          builder: (context) {
            return SimpleDialog(
              title: const Heading('Select field of activity'),
              children: SourceOfFunds.listOfFieldOfActivities
                  .map<SimpleDialogOption>((entry) {
                return SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context, entry);
                  },
                  child: Body(entry),
                );
              }).toList(),
            );
          });
      widget.onChanged(country);
      _focus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamTextField(
      focusNode: _focus,
      value: widget.value,
      labelText: widget.labelText,
    );
  }
}
