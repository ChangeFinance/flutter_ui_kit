import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import '../../color.dart';

class CategoryBadge extends StatefulWidget {
  final String text;
  final String tagText;
  final bool selected;
  final String name;
  final Function(String name) onTap;

  CategoryBadge({this.text, this.tagText = '', this.selected = false, this.onTap, this.name});

  @override
  _CategoryBadgeState createState() {
    return new _CategoryBadgeState();
  }
}

class _CategoryBadgeState extends State<CategoryBadge> {
  static const double badgeHeight = 36.0;
  static const double tagHeight = 20.0;
  static const double fontSize = 14.0;
  static const defaultTextStyle =
      TextStyle(color: AppColor.deepWhite, fontSize: fontSize, height: 1.0);

  static const selectedTextColor = AppColor.deepWhite;
  static const normalTextColor = AppColor.semiGrey;

  static const normalBgColor = AppColor.deepWhite;
  static const selectedBgColor = AppColor.green;
  static const tagDefaultBgColor = AppColor.semiGrey;
  static const tagDefaultEmptyBgColor = AppColor.lightestGrey;
  static const tagSelectedBgColor = AppColor.darkerGreen;

  static const pressedBgColor = AppColor.darkerGreen;
  static const tagPressedBgColor = AppColor.deepGreen;
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_positional_boolean_parameters
    void setPressed(bool pressed) {
      setState(() {
        this.pressed = pressed;
      });
    }
    final bgColor = pressed
        ? pressedBgColor
        : widget.selected ? selectedBgColor : normalBgColor;
    final border = pressed || widget.selected
        ? const Border.fromBorderSide(BorderSide(color: AppColor.deepWhite))
        : const Border.fromBorderSide(BorderSide(color: tagDefaultBgColor));
    return Container(
        key: Key('${widget.name}_container'),
        width: null,
        height: badgeHeight,
        decoration: BoxDecoration(
            borderRadius:
                const BorderRadius.all(Radius.circular(badgeHeight / 2)),
            border: border,
            color: bgColor),
        child: GestureDetector(
            onTapDown: (TapDownDetails _) {
              setPressed(true);
            },
            onTapUp: (TapUpDetails _) {
              setPressed(false);
            },
            onTap: () {
              setPressed(false);
              if (widget.onTap != null) {
                widget.onTap(widget.name);
              }
            },
            onTapCancel: () {
              setPressed(false);
            },
            child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(
                          10, badgeHeight / 4, 10, badgeHeight / 4),
                      child: Row(children: [_text(), _tag()])
                      )
                ])));
  }

  Widget _text() {
    final textColor =
        pressed || widget.selected ? selectedTextColor : normalTextColor;
    return Container(
        margin: const EdgeInsets.only(left: 8.0),
        child: Text(widget.text,
            style: defaultTextStyle.copyWith(color: textColor),
            textAlign: TextAlign.center));
  }

  Widget _tag() {
    final loading = widget.tagText.isEmpty;
    final tagBgColor = pressed
        ? tagPressedBgColor
        : widget.selected
            ? tagSelectedBgColor
            : loading ? tagDefaultEmptyBgColor : tagDefaultBgColor;

    return Center(
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          constraints: const BoxConstraints(minWidth: 26.0),
          height: tagHeight,
          decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.all(Radius.circular(badgeHeight / 2)),
              color: tagBgColor),
          child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Text(widget.tagText,
                          style: defaultTextStyle, textAlign: TextAlign.center),
                    )
                  ])),
    );
  }
}
