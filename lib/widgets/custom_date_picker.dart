import 'package:flutter/material.dart';

import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:flutter_ui_kit/widgets/filled_button.dart';

class CustomDatePicker extends StatefulWidget {

  const CustomDatePicker();

  @override
  State<StatefulWidget> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  final _format = 'dd-MM-yyyy';
  final _dayCtrl = TextEditingController();
  final _monthCtrl = TextEditingController();
  final _yearCtrl = TextEditingController();

  DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    _dayCtrl.text = null;
    _monthCtrl.text = null;
    _yearCtrl.text = null;
    _dateTime = DateTime.now();
  }

  /// Display time picker.
  void _showDatePicker() {
    DatePicker.showDatePicker(
      context,
      initialDateTime: DateTime.now(),
      dateFormat: _format,
      onCancel: () {
        updateState(DateTime.now());
      },
      onChange: (dateTime, List<int> index) {
        updateState(dateTime);
      },
      onConfirm: (dateTime, List<int> index) {
        updateState(dateTime);
      },
    );
  }

  void updateState(DateTime dateTime) {
    setState(() {
      _dateTime = dateTime;
      _dayCtrl.text = _dateTime.day.toString().padLeft(2, '0');
      _monthCtrl.text = _dateTime.month.toString().padLeft(2, '0');
      _yearCtrl.text = _dateTime.year.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        new Flexible(
            child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Container(
                    width: 60,
                    child: TextField(
                      focusNode: DisabledFocusNode(),
                      controller: _dayCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Day',
                        hintText: 'DD',
                        hintStyle: const TextStyle(color: Colors.white30),
                      ),
                      onTap: _showDatePicker,
                    )))),
        new Flexible(
            child: Container(
                width: 80,
                child: TextField(
                  focusNode: DisabledFocusNode(),
                  controller: _monthCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Month',
                    hintText: 'MM',
                    hintStyle: const TextStyle(color: Colors.black26),
                  ),
                  onTap: _showDatePicker,
                ))),
        new Flexible(
            child: Padding(
                padding: const EdgeInsets.only(right: 30.00),
                child: TextField(
                  focusNode: DisabledFocusNode(),
                  controller: _yearCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Year',
                    hintText: 'YYYY',
                    hintStyle: const TextStyle(color: Colors.black26),
                  ),
                  onTap: _showDatePicker,
                )))
      ]),
    ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: new FilledButton(
          'Next',
          fullWidth: true,
          onPressed: () {
            print('You selected: $_dateTime');
          },
        )),
    );
  }
}

class DisabledFocusNode extends FocusNode {
  @override
  bool consumeKeyboardToken() {
    return false;
  }
}