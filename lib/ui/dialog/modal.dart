import 'package:flutter/material.dart';

@Deprecated('Use ChgModal')
class Modal extends StatelessWidget {
  final List<Widget> children;

  const Modal({this.children});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.all(12.0),
      children: children,
    );
  }
}

class ChgModal extends Modal {
  ChgModal({List<Widget> children}) : super(children: children);
}
