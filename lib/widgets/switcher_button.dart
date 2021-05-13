import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/text.dart';
import 'package:flutter_ui_kit/widgets/change_app_icons.dart';

import '../color.dart';

class SwitcherButton extends StatefulWidget {
  final List<String> labels;
  final Function(int) onSwitch;
  final bool showLabel;

  SwitcherButton({
    @required this.labels,
    this.onSwitch,
    this.showLabel = true,
  });

  @override
  _SwitcherButtonState createState() => _SwitcherButtonState();
}

class _SwitcherButtonState extends State<SwitcherButton> {
  List<String> get labels => widget.labels;

  Function(int) get onSwitch => widget.onSwitch;

  String get currentLabel {
    if (labels.isEmpty) {
      _currentIndex = 0;
      return '';
    }
    if (_currentIndex >= labels.length) {
      _currentIndex = labels.length - 1;
    }
    return labels[_currentIndex];
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(10),
      ).copyWith(
        overlayColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return AppColor.grey;
          }
          return null;
        }),
      ),
      onPressed: _switch,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ChangeAppIcons.switch_arrow,
          const SizedBox(height: 8),
          widget.showLabel ? Text(currentLabel, style: AppText.body3) : Container(),
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
