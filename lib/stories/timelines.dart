import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/story_book/expandable_story.dart';
import 'package:flutter_ui_kit/widgets/timeline/timeline.dart';

class Timelines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _timeline(),
        ],
      ),
    );
  }

  Widget _timeline() {
    return ExpandableStory(
      title: 'Timeline',
      child: Timeline(
        activeLineColor: AppColor.green,
        lineGap: 0,
        itemGap: 50,
        children: <TimelineModel>[
          TimelineModel(widget: _buildTimelineItem('Previous interest payday', 'Mar 1', true, true), isActive: true),
          TimelineModel(
              widget: _buildTimelineItem(
                  'Deposit funds to earn 2.00% APY after it\'s transferd to our Service Providers ',
                  'Transfer funds to Interest',
                  false,
                  true),
              isActive: false),
          TimelineModel(widget: _buildTimelineItem('Next interest payday', 'Apr 1', false, false), isActive: false),
        ],
        indicators: <Widget>[
          Icon(Icons.check_circle, color: AppColor.green),
          Icon(Icons.check_circle_outline, color: AppColor.semiGrey),
          Icon(Icons.check_circle_outline, color: AppColor.semiGrey),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(String title, String linkText, bool isActive, bool linkIsActive) {
    final titleStyle = TextStyle(fontSize: 14, height: 20 / 14, color: isActive ? Colors.black : AppColor.semiGrey);
    final linkStyle = titleStyle.copyWith(color: linkIsActive ? AppColor.green : AppColor.semiGrey);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: titleStyle, textAlign: TextAlign.start),
        Text(linkText, style: linkStyle, textAlign: TextAlign.start),
      ],
    );
  }
}
