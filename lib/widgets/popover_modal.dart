import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';

class PopoverModal {
  void showPopover(
    BuildContext context,
    Widget child,
  ) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return new Container(
            color: const Color(0xFF737373),
            child: Container(
                decoration: new BoxDecoration(
                    color: AppColor.deepWhite,
                    borderRadius: const BorderRadius.only(
                        topLeft: const Radius.circular(20.0),
                        topRight: const Radius.circular(20.0))),
                child: child),
          );
        });
  }
}
