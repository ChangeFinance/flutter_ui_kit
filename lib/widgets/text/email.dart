import 'package:flutter/material.dart';

typedef Callback = void Function(String value);

class Email extends StatelessWidget {
  final String errorText;
  final TextEditingController controller;
  final Callback onChanged;

  const Email({this.errorText, this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
        key: const Key('email'),
        keyboardType: TextInputType.emailAddress,
        textCapitalization: TextCapitalization.none,
        autocorrect: false,
        controller: controller ?? TextEditingController(),
        decoration: InputDecoration(
            labelText: 'Email Address',
            labelStyle: const TextStyle(fontSize: 18, height: -1.0),
            focusedBorder: const UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey)),
            hintStyle: const TextStyle(color: Colors.white30),
            errorText: errorText,
            errorStyle: const TextStyle(color: Colors.red)),
        autofocus: true,
        onChanged: onChanged);
  }
}
