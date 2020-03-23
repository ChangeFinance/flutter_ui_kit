import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/ui/colors.dart';

import '../color.dart';
import '../text.dart';

class PinView extends StatelessWidget {
  final int length;
  final String text;
  final bool displayText;

  PinView(this.length, this.text, {this.displayText = false});

  @override
  Widget build(BuildContext context) {
    final content = displayText
        ? List<Widget>.generate(length, (index) => PinText(character: index <= text.runes.length - 1 ? String.fromCharCode(text.runes.elementAt(index)): ''))
        : List<Widget>.generate(length, (index) => PinDot(active: index <= text.runes.length - 1));
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: content,
      ),
    );
  }
}

@visibleForTesting
class PinDot extends StatelessWidget {
  final bool active;

  const PinDot({@required this.active});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: active ? AppColor.darkerGreen : AppColor.paleGreen),
      child: const SizedBox(width: 15, height: 15),
    );
  }
}

@visibleForTesting
class PinText extends StatelessWidget {
  final String character;

  const PinText({@required this.character});

  @override
  Widget build(BuildContext context) {
    final underlineColor = character == '' ? AppColors.primaryColor : AppColors.primaryColorDarker;
    return Container(
      width: 56.0,
      height: 28.0,
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: underlineColor, width: 2.0))),
      child: Text(character, style: AppText.body1, textAlign: TextAlign.center,)
    );
  }
}
