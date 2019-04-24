import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

abstract class StoryPage extends StatelessWidget {
  List<Widget> get storyContent;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: storyContent,
      ),
    );
  }
}
