import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_kit/color.dart';

class CopyToClipboard extends StatelessWidget {
  final String? value;

  const CopyToClipboard({this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: GestureDetector(
        child: IconTheme(
            data: IconTheme.of(context).copyWith(color: AppColor.green ),
            child: const Icon(
              Icons.content_copy,
              size: 20.0,
            )),
        onTap: () {
          Clipboard.setData(new ClipboardData(text: value));
          const snackBar =
              const SnackBar(content: const Text('Copied to clipboard'));
          Scaffold.of(context).showSnackBar(snackBar);
        },
      ),
    );
  }
}
