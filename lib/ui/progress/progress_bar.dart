import 'package:flutter/material.dart';

import '../../color.dart';

class ProgressBar extends StatelessWidget {
  final Key progressKey;
  final double progress;

  const ProgressBar({
    @required this.progress,
    this.progressKey,
  }) : assert(progress >= 0 && progress <= 1);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final maxProgress = size.width / 1.5;
    return Container(
      color: AppColor.ltGreenPrimary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          new Container(
            key: progressKey,
            color: AppColor.ltGreenPrimary,
            constraints: new BoxConstraints.tightFor(
              width: maxProgress * progress,
              height: 4.0,
            ),
          )
        ],
      ),
      constraints: BoxConstraints.tightFor(
        width: maxProgress,
        height: 4.0,
      ),
    );
  }
}
