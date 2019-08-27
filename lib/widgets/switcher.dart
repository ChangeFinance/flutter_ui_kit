import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/theme.dart';

import 'change_app_icons.dart';

class Switcher extends StatefulWidget {
  final List<String> buttonLabels;
  final List<String> values;
  final Function(int) activeIndexListener;

  Switcher(
      {@required this.buttonLabels,
      @required this.values,
      this.activeIndexListener})
      : assert(values.isNotEmpty);

  @override
  _SwitcherState createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  List<String> get buttonLabels => widget.buttonLabels;

  List<String> get values => widget.values;

  Function(int) get activeIndexListener => widget.activeIndexListener;

  String get currentLabel => buttonLabels[currentIndex];

  String get currentText => values[currentIndex];

  String get nextText {
    if (currentIndex == values.length - 1) {
      return values[0];
    } else {
      return values[currentIndex + 1];
    }
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(child: Container(), flex: 2),
          _buildDisplay(context),
          Expanded(child: Container(), flex: 1),
          _buildButton(context),
        ],
      ),
    );
  }

  Widget _buildDisplay(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(currentText,
            maxLines: 1,
            style:
                theme.textTheme.display4.copyWith(color: AppColor.deepBlack)),
        const SizedBox(height: 10),
        values.length == 1
            ? Container()
            : Text(nextText,
                style:
                    theme.textTheme.body2.copyWith(color: AppColor.semiGrey)),
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return FlatButton(
      onPressed: _switch,
      splashColor: AppColor.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ChangeAppIcons.switch_arrow,
          const SizedBox(height: 10),
          Text(currentLabel, style: theme.textTheme.subtitle),
        ],
      ),
    );
  }

  void _switch() {
    setState(() {
      if (currentIndex == buttonLabels.length - 1) {
        currentIndex = 0;
      } else {
        currentIndex++;
      }
      if (activeIndexListener != null) {
        activeIndexListener(currentIndex);
      }
    });
  }
}
