import 'dart:async';

import 'package:flutter/material.dart';

import 'decorated_text_field.dart';

class ChgStreamTextField extends StatefulWidget {
  final Stream<String> value;
  final ValueChanged onChanged;
  final int maxLines;
  final TextCapitalization textCapitalization;
  final VoidCallback onBlur;
  final VoidCallback onFocus;
  final String labelText;
  final TextInputType keyboardType;
  final bool obscureText;
  final String hintText;
  final String helperText;
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

  const ChgStreamTextField({
    Key key,
    this.value,
    this.onChanged,
    this.maxLines = 1,
    this.textCapitalization = TextCapitalization.none,
    this.onBlur,
    this.onFocus,
    this.labelText,
    this.hintText,
    this.helperText,
    this.autofocus,
    this.focusNode,
    this.prefixIcon,
    this.prefixText,
    this.prefixStyle,
    this.suffixText,
    this.suffixIcon,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.autocorrect = true,
    this.enableInteractiveSelection = true,
  }) : super(key: key);

  @override
  ChgStreamTextFieldState createState() {
    return new ChgStreamTextFieldState();
  }
}

class ChgStreamTextFieldState extends State<ChgStreamTextField> {
  TextEditingController _controller;
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    if (!_focusNode.hasFocus && widget.onBlur != null) {
      widget.onBlur();
    }

    if (_focusNode.hasFocus && widget.onFocus != null) {
      widget.onFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: widget.value,
        builder: (context, snapshot) {
          if (snapshot.data != _controller.text && !snapshot.hasError) {
            _controller.text = snapshot.data;
          }
          return DecoratedTextField(
            prefixIcon: widget.prefixIcon,
            prefixText: widget.prefixText,
            prefixStyle: widget.prefixStyle,
            suffixText: widget.suffixText,
            suffixIcon: widget.suffixIcon,
            controller: _controller,
            onChanged: widget.onChanged,
            maxLines: widget.maxLines,
            textCapitalization: widget.textCapitalization,
            obscureText: widget.obscureText,
            labelText: widget.labelText,
            hintText: widget.hintText,
            errorText: snapshot.error,
            helperText: widget.helperText,
            keyboardType: widget.keyboardType,
            autofocus: widget.autofocus,
            focusNode: _focusNode,
            enabled: widget.enabled,
            autocorrect: widget.autocorrect,
            enableInteractiveSelection: widget.enableInteractiveSelection,
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode.dispose();
  }
}
