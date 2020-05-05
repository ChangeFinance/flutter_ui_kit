import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';

class ProgressTimeline extends StatelessWidget {
  final List<ProgressTimelineModel> timeline;

  const ProgressTimeline(this.timeline);

  @override
  Widget build(BuildContext context) {
    return Timeline.builder(
      shrinkWrap: true,
      itemCount: timeline.length,

    );
  }
}

class ProgressTimelineModel {
  final bool isActive;
  final String title;
  final String actionTitle;

  ProgressTimelineModel(
    this.title, {
    this.actionTitle,
    this.isActive = false,
  });
}
