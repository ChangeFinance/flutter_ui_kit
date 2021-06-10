import 'package:flutter/material.dart';

class ExpandableStory extends StatelessWidget {
  final String title;
  final Widget child;

  const ExpandableStory({
    required this.child,
    required this.title,
  })  : super();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 24.0),
          child: child,
        ),
      ],
    );
  }
}
