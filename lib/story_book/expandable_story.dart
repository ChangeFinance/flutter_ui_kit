import 'package:flutter/material.dart';

class ExpandableStory extends StatelessWidget {
  final String title;
  final Widget child;

  const ExpandableStory({
    required this.child,
    required this.title,
  })  : assert(child != null),
        assert(title != null),
        super();

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
