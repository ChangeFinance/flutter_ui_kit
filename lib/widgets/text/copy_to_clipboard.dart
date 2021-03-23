import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../color.dart';

class CopyToClipboard extends StatelessWidget {
  final String value;
  final String title;
  final Color color;
  final Function onTapCallback;

  const CopyToClipboard({
    this.value,
    this.onTapCallback,
    this.title = 'Copied to clipboard',
    this.color = AppColor.ltGreenPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: GestureDetector(
        child: IconTheme(
          data: IconTheme.of(context).copyWith(
            color: color,
          ),
          child: const Icon(
            Icons.content_copy,
            size: 20.0,
          ),
        ),
        onTap: () {
          Clipboard.setData(
            ClipboardData(text: value),
          );
          final snackBar = SnackBar(
            content: Text(title),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          if (onTapCallback != null) {
            onTapCallback();
          }
        },
      ),
    );
  }
}
