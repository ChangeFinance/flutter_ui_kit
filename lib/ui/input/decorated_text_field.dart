import 'package:flutter/material.dart';

class DecoratedTextField extends StatelessWidget {
  final Function onChanged;
  final int maxLines;
  final TextCapitalization textCapitalization;
  final String labelText;
  final String errorText;
  final TextInputType keyboardType;
  final bool obscureText;
  final String hintText;
  final String helperText;
  final TextEditingController controller;
  final bool autofocus;
  final FocusNode focusNode;
  final Widget prefixIcon;
  final String prefixText;
  final TextStyle prefixStyle;
  final Widget suffixIcon;
  final String suffixText;
  final bool enabled;
  final bool autocorrect;
  final bool enableInteractiveSelection;

  const DecoratedTextField({
    this.onChanged,
    this.maxLines = 1,
    this.textCapitalization = TextCapitalization.none,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.controller,
    this.autofocus,
    this.prefixIcon,
    this.prefixText,
    this.prefixStyle,
    this.suffixText,
    this.suffixIcon,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.obscureText = false,
    this.autocorrect,
    this.enableInteractiveSelection = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const smallTextStyle = TextStyle(fontSize: 12.0);
    return Container(
      padding: const EdgeInsets.only(top: 8.0),
      child: new TextField(
        onChanged: onChanged,
        maxLines: maxLines,
        textCapitalization: textCapitalization,
        obscureText: obscureText,
        keyboardType: keyboardType,
        controller: controller,
        focusNode: focusNode,
        autofocus: autofocus ?? false,
        autocorrect: autocorrect,
        style: theme.textTheme.bodyText2,
        enableInteractiveSelection: enableInteractiveSelection,
        decoration: InputDecoration(
          enabled: enabled,
          prefixIcon: prefixIcon,
          prefixText: prefixText,
          prefixStyle: prefixStyle,
          suffixText: suffixText,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: smallTextStyle,
          errorText: errorText,
          labelText: labelText,
          helperText: helperText,
          helperStyle: smallTextStyle,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
