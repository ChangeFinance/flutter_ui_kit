import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/text.dart';
import 'package:flutter_ui_kit/widgets/filled_button.dart';
import 'package:flutter_ui_kit/widgets/text_button.dart';

typedef Callback = void Function(String value);

enum TimeFrame {
  ONE_HOUR,
  ONE_DAY,
  ONE_WEEK,
  ONE_MONTH,
  ONE_YEAR,
  FIVE_YEARS
}

class TimeFrameHelper {
  static TimeFrame getKey(String timeFrame) {
    switch (timeFrame) {
      case '1H':
        return TimeFrame.ONE_HOUR;
      case '1D':
        return TimeFrame.ONE_DAY;
      case '1W':
        return TimeFrame.ONE_WEEK;
      case '1M':
        return TimeFrame.ONE_MONTH;
      case '1Y':
        return TimeFrame.ONE_YEAR;
      case '5Y':
        return TimeFrame.FIVE_YEARS;
      default:
        return null;
    }
  }

  static String getValue(TimeFrame timeFrame) {
    switch (timeFrame) {
      case TimeFrame.ONE_HOUR:
        return '1H';
      case TimeFrame.ONE_DAY:
        return '1D';
      case TimeFrame.ONE_WEEK:
        return '1W';
      case TimeFrame.ONE_MONTH:
        return '1M';
      case TimeFrame.ONE_YEAR:
        return '1Y';
      case TimeFrame.FIVE_YEARS:
        return '5Y';
      default:
        return 'ERROR';
    }
  }
}

class TimeFrameSelector extends StatefulWidget {
  final Callback onChange;
  final TimeFrame defaultTimeFrame;
  final TimeFrame maxTimeFrame;

  const TimeFrameSelector({Key key,
    this.defaultTimeFrame = TimeFrame.ONE_DAY,
    this.maxTimeFrame = TimeFrame.ONE_YEAR,
    this.onChange})
      : super(key: key);

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

    final checkedButton = FilledButton(
        TimeFrameHelper.getValue(selected),
        onPressed: onPressed,
        textStyle: AppText.graphTextStyle.copyWith(color: AppColor.deepWhite),
        padding: const EdgeInsets.all(0.0)
    );
    final uncheckedButton = TextButton(
      TimeFrameHelper.getValue(selected),
        onPressed: onPressed,
        textStyle: AppText.graphTextStyle.copyWith(color: AppColor.deepBlack),
        padding: const EdgeInsets.all(0.0),
    );

    return Expanded(
        flex: 1 ,
        child: Container(
            height: 22.0 ,
            child: (selectedTimeFrame == selected) ? checkedButton : uncheckedButton
        )
    );
  }

  Expanded _buildDisableItem(TimeFrame selected) {
    final uncheckedButton = TextButton(
        TimeFrameHelper.getValue(selected),
        textStyle: AppText.graphTextStyle.copyWith(color: AppColor.semiGrey),
        padding: const EdgeInsets.all(0.0)
    );

    return Expanded(
        flex: 1,
        child: Container(
            height: 22.0,
            child: uncheckedButton
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    final widgets = <Widget>[];
    final timeFrames = TimeFrame.values.toList();

    for (var timeFrame in TimeFrame.values) {
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
        children: widgets
    );
  }
}
