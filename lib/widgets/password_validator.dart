import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/widgets/simple_progress_indicator.dart';

class PasswordValidator extends StatefulWidget {
  final String password;
  final List<String> hintList;
  final List<String> strengthList;
  final List<Color> colorList;

  const PasswordValidator({
    Key? key,
    this.password = 'Password123*',
    this.hintList = const [
      'Try making it longer then 8 digits and adding capital characters that makes it difficult for others to guess.',
      'That is a good password, but you can try to add digits and special characters to make it a great one!',
      'You can enable two-factor authentication later.',
      'Make it longer than 8 characters.'
    ],
    this.strengthList = const ['bad', 'weak', 'normal', 'good', 'great', 'bad'],
    this.colorList = const [
      Colors.redAccent,
      Colors.orangeAccent,
      Colors.blueAccent,
      Colors.lightGreen,
      Colors.greenAccent
    ],
  })  : super(key: key);

  @override
  _PasswordValidatorState createState() => _PasswordValidatorState();
}

class _PasswordValidatorState extends State<PasswordValidator> {
  int _passwordStrength() {
    var counter = 1;
    if (widget.password.length > 8) {
      counter = counter + 1;
    }
    if (widget.password.contains(new RegExp(r'[A-Z]'))) {
      counter = counter + 1;
    }
    if (widget.password.contains(new RegExp(r'[0-9]'))) {
      counter = counter + 1;
    }
    if (widget.password
        .contains(new RegExp(r'[!@_#$\%;^&*+(),.?":\-{}|<>/\\]'))) {
      counter = counter + 1;
    }
    return counter;
  }

  String _strengthToText() {
    final passwordStrength = _passwordStrength();
    switch (passwordStrength) {
      case 1:
        {
          return 'Strength: ${widget.strengthList[0]}';
        }

      case 2:
        {
          return 'Strength: ${widget.strengthList[1]}';
        }

      case 3:
        {
          return 'Strength: ${widget.strengthList[2]}';
        }

      case 4:
        {
          return 'Strength: ${widget.strengthList[3]}';
        }

      case 5:
        {
          return 'Strength: ${widget.strengthList[4]}';
        }

      default:
        {
          return 'Strength: ${widget.strengthList[0]}';
        }
    }
  }

  Color _strengthToColor() {
    final passwordStrength = _passwordStrength();
    switch (passwordStrength) {
      case 1:
        {
          return widget.colorList[0];
        }

      case 2:
        {
          return widget.colorList[1];
        }

      case 3:
        {
          return widget.colorList[2];
        }

      case 4:
        {
          return widget.colorList[3];
        }

      case 5:
        {
          return widget.colorList[4];
        }

      default:
        {
          return widget.colorList[0];
        }
    }
  }

  String _hint() {
    if (widget.password.length > 8) {
      if (widget.password.contains(new RegExp(r'[A-Z]'))) {
        if (widget.password.contains(RegExp(r'[0-9]'))) {
          if (widget.password
              .contains(new RegExp(r'[!@_#$\%;^&*+(),.?":\-{}|<>/\\]'))) {
            return widget.hintList[2];
          } else {
            return widget.hintList[1];
          }
        } else {
          return widget.hintList[1];
        }
      } else {
        return widget.hintList[0];
      }
    } else {
      if (widget.password.contains(new RegExp(r'[A-Z]'))) {
        if (widget.password.contains(RegExp(r'[0-9]'))) {
          if (widget.password
              .contains(new RegExp(r'[!@_#$\%;^&*+(),.?":\-{}|<>/\\]'))) {
            return widget.hintList[3];
          }
        }
      }
      return widget.hintList[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          _strengthToText(),
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
        ),
        SimpleProgressIndicator(
          background: true,
          height: 5.0,
          roundedBorder: 10.0,
          color: _strengthToColor(),
          percentageFilled: (_passwordStrength()) * 20.0,
        ),
        const Padding(
          padding: const EdgeInsets.only(top: 10.0),
        ),
        Text(
          _hint(),
          textAlign: TextAlign.left,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 13.0,
          ),
        ),
      ],
    );
  }
}
