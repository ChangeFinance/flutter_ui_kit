import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/theme.dart';
import 'package:flutter_ui_kit/widgets/change_app_icons.dart';

class SwitcherButton extends StatefulWidget {
  final List<String> labels;
  final Function(int) onSwitch;

  SwitcherButton({@required this.labels, this.onSwitch});

  @override
  _SwitcherButtonState createState() => _SwitcherButtonState();
}

class _SwitcherButtonState extends State<SwitcherButton> {
  List<String> get labels => widget.labels;

  Function(int) get onSwitch => widget.onSwitch;

  String get currentLabel {
    if (labels.isEmpty) {
      return '';
    }
    return labels[_currentIndex];
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: const EdgeInsets.all(10),
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
      if (_currentIndex == labels.length - 1) {
        _currentIndex = 0;
      } else {
        _currentIndex++;
      }

      if (onSwitch != null) {
        onSwitch(_currentIndex);
      }
    });
  }
}
