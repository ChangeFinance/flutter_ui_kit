import 'package:flutter/material.dart';

import '../../color.dart';

class PasscodeView extends StatelessWidget {
  final int length;
  final String text;

  PasscodeView(this.length, this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: List<Widget>.generate(length, (index) => _PasscodeDot(active: index <= text.runes.length - 1)),
      ),
    );
  }
}

class _PasscodeDot extends StatelessWidget {
  final bool active;

  const _PasscodeDot({@required this.active});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: active ? AppColor.darkerGreen : AppColor.paleGreen),
      child: const SizedBox(width: 15, height: 15),
    );
  }
}
