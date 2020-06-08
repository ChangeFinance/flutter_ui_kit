import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/text.dart';
import 'package:flutter_ui_kit/widgets/filled_button.dart';
import 'package:flutter_ui_kit/widgets/text_button.dart';

typedef Callback = void Function(String value);

enum TimeFrame { ONE_HOUR, ONE_DAY, ONE_WEEK, ONE_MONTH, THREE_MONTHS, SIX_MONTHS, ONE_YEAR, THREE_YEARS, FIVE_YEARS }

class TimeFrameHelper {
  static const Map<String, TimeFrame> timeFrames = {
    '1H': TimeFrame.ONE_HOUR,
    '1D': TimeFrame.ONE_DAY,
    '1W': TimeFrame.ONE_WEEK,
    '1M': TimeFrame.ONE_MONTH,
    '3M': TimeFrame.THREE_MONTHS,
    '6M': TimeFrame.SIX_MONTHS,
    '1Y': TimeFrame.ONE_YEAR,
    '3Y': TimeFrame.THREE_YEARS,
    '5Y': TimeFrame.FIVE_YEARS,
  };

  static TimeFrame getKey(String timeFrame) {
    return timeFrames[timeFrame];
  }

  static String getValue(TimeFrame timeFrame) {
    return timeFrames.entries.firstWhere((entry) => entry.value == timeFrame, orElse: () => null)?.key ?? 'ERROR';
  }
}

class TimeFrameSelector extends StatefulWidget {
  final Callback onChange;
  final TimeFrame defaultTimeFrame;
  final TimeFrame maxTimeFrame;
  final List<TimeFrame> exclude;

  const TimeFrameSelector({
    Key key,
    this.exclude = const [TimeFrame.THREE_MONTHS, TimeFrame.SIX_MONTHS, TimeFrame.THREE_YEARS],
    this.defaultTimeFrame = TimeFrame.ONE_DAY,
    this.maxTimeFrame = TimeFrame.ONE_YEAR,
    this.onChange,
  }) : super(key: key);

  @override
  TimeFrameSelectorWidgetState createState() => TimeFrameSelectorWidgetState();
}

class TimeFrameSelectorWidgetState extends State<TimeFrameSelector> {
  TimeFrame selectedTimeFrame;

  @override
  void initState() {
    super.initState();
    selectedTimeFrame = widget.defaultTimeFrame;
    widget.onChange(TimeFrameHelper.getValue(selectedTimeFrame));
  }

  void _onPressedPeriod(TimeFrame selected) {
    setState(() {
      selectedTimeFrame = selected;
      widget.onChange(TimeFrameHelper.getValue(selectedTimeFrame));
    });
  }

  Expanded _buildItem(TimeFrame selected) {
    Future<void> onPressed() async {
      _onPressedPeriod(selected);
    }

    final checkedButton = FilledButton(TimeFrameHelper.getValue(selected),
        onPressed: onPressed,
        textStyle: AppText.graphTextStyle.copyWith(color: AppColor.deepWhite),
        padding: const EdgeInsets.all(0.0));
    final uncheckedButton = TextButton(
      TimeFrameHelper.getValue(selected),
      onPressed: onPressed,
      textStyle: AppText.graphTextStyle.copyWith(color: AppColor.deepBlack),
      padding: const EdgeInsets.all(0.0),
    );

    return Expanded(
        flex: 1,
        child: Container(height: 22.0, child: (selectedTimeFrame == selected) ? checkedButton : uncheckedButton));
  }

  Expanded _buildDisableItem(TimeFrame selected) {
    final uncheckedButton = TextButton(TimeFrameHelper.getValue(selected),
        textStyle: AppText.graphTextStyle.copyWith(color: AppColor.semiGrey), padding: const EdgeInsets.all(0.0));

    return Expanded(flex: 1, child: Container(height: 22.0, child: uncheckedButton));
  }

  @override
  Widget build(BuildContext context) {
    final widgets = <Widget>[];
    final allTimeFrames = TimeFrame.values.where((tf) => !widget.exclude.contains(tf)).toList();
    final timeFrames = <TimeFrame>[]..addAll(allTimeFrames);

    for (var timeFrame in allTimeFrames) {
      widgets.add(_buildItem(timeFrame));
      timeFrames.remove(timeFrame);
      if (timeFrame == widget.maxTimeFrame) {
        break;
      }
    }

    for (var timeFrame in timeFrames) {
      widgets.add(_buildDisableItem(timeFrame));
    }

    return new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: widgets);
  }
}
