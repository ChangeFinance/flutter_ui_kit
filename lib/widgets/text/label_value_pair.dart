import 'package:flutter/material.dart';
import 'copy_to_clipboard.dart';
import 'label_text.dart';

class ChgLabelValuePair extends StatelessWidget {
  final String labelText;
  final String valueText;
  final Widget value;
  final ChgValueLabelTextAlign textAlign;
  final bool copyToClipboardEnabled;
  final EdgeInsets padding;

  const ChgLabelValuePair({
    @required this.labelText,
    this.valueText,
    this.copyToClipboardEnabled = false,
    this.textAlign,
    this.value,
    this.padding
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: _isCenterAligned(textAlign)
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              LabelText(labelText),
              _buildBody(context, value, valueText, padding: padding),
            ],
          ),
        ),
      ],
    );
  }

  bool _isCenterAligned(ChgValueLabelTextAlign textAlign) {
    return textAlign != null && textAlign == ChgValueLabelTextAlign.center;
  }

  Widget _buildBody(BuildContext context, Widget value, String data, {EdgeInsets padding}) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: _isCenterAligned(textAlign)
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          Flexible(child: value != null ? value :  Text(data, style: const TextStyle(fontSize: 16 , fontFamily: 'DINNextLTPro', color: Colors.black, height: 1.5, fontWeight: FontWeight.w500))),
          _buildCopyToClipboardIcon(context, data),
        ],
      ),
    );
  }

  Widget _buildCopyToClipboardIcon(BuildContext context, String value) {
    if (!copyToClipboardEnabled) {
      return Container();
    }
    return CopyToClipboard(value: value);
  }

}

enum ChgValueLabelTextAlign { center, left }

