import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_kit/widgets/card.dart';
import 'package:flutter_ui_kit/widgets/filled_button.dart';

import '../color.dart';
import '../text.dart';

class SliverWidgets {

  List<Widget> buildSliverList() {
    final sliverList = <Widget>[];
    for(var i = 0; i <= 6; i++) {
     sliverList.add(appCard());
    }
    return sliverList;
  }

  Widget appCard() {
    return AppCard(
        color: AppColor.deepWhite,
        elevation: 2,
        margin: const EdgeInsets.all(6),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2.0),
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          width: 50.0,
          height: 70.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ));
  }

  Widget bottomButton() {
    return FilledButton('Make a deposit', fullWidth: true, onPressed: () {
      debugPrint('Hello you clicked');
    });
  }

  Widget copy() {
    return const Text(
      'Make a Euro deposit to start investing',
      textAlign: TextAlign.center,
      style: AppText.header5,
    );
  }

  Widget svgPicture() {
    return SvgPicture.asset('assets/update-app.svg',
        width: 80.0, height: 85.0);
  }
}
