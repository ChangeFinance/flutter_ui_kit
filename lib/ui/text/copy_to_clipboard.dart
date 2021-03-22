import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors.dart';

class CopyToClipboard extends StatelessWidget {
  final String value;
  final Function onTapCallback;

  const CopyToClipboard({
    this.value,
    this.onTapCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: GestureDetector(
        child: IconTheme(
            data: IconTheme.of(context).copyWith(color: AppColors.secondary),
            child: const Icon(
              Icons.content_copy,
              size: 20.0,
            )),
        onTap: () {
          if (onTapCallback != null) {
            onTapCallback();
          }
          Clipboard.setData(new ClipboardData(text: value));
          const snackBar = const SnackBar(content: const Text('Copied to clipboard'));
          Scaffold.of(context).showSnackBar(snackBar);
        },
      ),
    );
  }
}
