import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import 'badge.dart';

class MultiValueBadge extends StatefulWidget {
  final List<String> texts;
  final double? minWidth;
  final TextStyle? textStyle;
  final Color? bgColor;

  MultiValueBadge(this.texts, {this.minWidth, this.textStyle, this.bgColor})
  :assert(texts!=null),
   assert(texts.isNotEmpty) {
    createState();
  }

  @override
  _MultiValueBadgeState createState() {
    return new _MultiValueBadgeState(0);
  }
}

class _MultiValueBadgeState extends State<MultiValueBadge> {

  int currentIdx = 0;
  _MultiValueBadgeState(this.currentIdx);

  @override
  Widget build(BuildContext context) {
    void onTap() {
      setState((){
        currentIdx = (++currentIdx)%widget.texts.length;
      });
    }

    return Badge(widget.texts[currentIdx],
        minWidth: widget.minWidth,
        textStyle: widget.textStyle,
        bgColor: widget.bgColor,
        onTap: onTap);
  }
}
