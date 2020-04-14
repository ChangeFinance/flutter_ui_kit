import 'package:characters/characters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/widgets/odometer/single_digit.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_ui_kit/widgets/odometer/text_run.dart';

class UnstyledTextRun {
  final String initialText;
  final String currentText;

  UnstyledTextRun(this.currentText, this.initialText) : assert(isValidPair(currentText, initialText));

  static bool isNumberOrDot(String text) {
    return num.tryParse(text) != null || isDot(text);
  }

  static bool isDot(String text) => '.' == text;

  static bool isValidPair(String current, String initial) {
    if (isDot(initial) && !isDot(current)) {
      return false;
    }

    if ((!isDot(current) && current.endsWith('.')) || (!isDot(initial) && initial.endsWith('.'))) {
      return false;
    }
    return true;
  }
}

class OdometerBadge extends StatelessWidget {
  final List<UnstyledTextRun> textRuns;
  final Color baseColor;
  final Color bgColor;
  final VoidCallback onTap;
  final TextStyle textStyle;

  const OdometerBadge(
    this.textRuns, {
    Key key,
    this.baseColor = Colors.white,
    this.bgColor = AppColor.green,
    this.onTap,
    this.textStyle = const TextStyle(color: AppColor.deepWhite, fontSize: 15, height: 1.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final odometerSize = _getOdometerSize();
    final badgeHeight = odometerSize.height + 4;

    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(badgeHeight / 1.5)), color: bgColor ?? AppColor.green),
        child: GestureDetector(
            onTap: onTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: badgeHeight / 4),
                  child: Shimmer.fromColors(
                    key: new Key(textRuns.map((r) => '${r.initialText}-${r.currentText}').join(',')),
                    baseColor: baseColor,
                    highlightColor: bgColor,
                    loop: 1,
                    period: const Duration(milliseconds: 750),
                    child: SizedOverflowBox(
                      size: _getOdometerSize(),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: _getChildren(),
                      ),
                    ),
                  ),
                )
              ],
            )));
  }

  List<Widget> _getChildren() {
    final currentTextRunChars = <MapEntry<String, TextStyle>>[];
    final initialTextRunChars = <MapEntry<String, TextStyle>>[];

    final textStyle = this.textStyle.copyWith(height: 1.0);
    for (final run in textRuns) {
      for (final char in Characters(run.currentText)) {
        currentTextRunChars.add(MapEntry(char, textStyle));
      }

      for (final char in Characters(run.initialText)) {
        initialTextRunChars.add(MapEntry(char, textStyle));
      }
    }

    if (initialTextRunChars.length == currentTextRunChars.length &&
        _equalDotIndex(initialTextRunChars, currentTextRunChars)) {
      return _getChildrenForEqualFormatChildren(initialTextRunChars, currentTextRunChars);
    } else {
      return _getChildrenForUnequalFormatChildren(initialTextRunChars, currentTextRunChars);
    }
  }

  List<Widget> _getChildrenForEqualFormatChildren(
      List<MapEntry<String, TextStyle>> initial, List<MapEntry<String, TextStyle>> current) {
    final children = <Widget>[];
    for (var i = 0; i < initial.length; i++) {
      final initialVal = int.tryParse(initial[i].key);
      final finalVal = int.tryParse(current[i].key);
      final textStyle = current[i].value;

      if (initialVal != null && finalVal != null) {
        children
            .add(SingleDigit(initialValue: initialVal, finalValue: finalVal, textStyle: textStyle, key: UniqueKey()));
      } else {
        children.add(Text(current[i].key, style: textStyle));
      }
    }
    return children;
  }

  List<Widget> _getChildrenForUnequalFormatChildren(
      List<MapEntry<String, TextStyle>> initial, List<MapEntry<String, TextStyle>> current) {
    final children = <Widget>[];
    var dotAdded = false;
    for (var i = 0; i < current.length; i++) {
      int finalVal, initialVal;
      if ('.' == current[i].key) {
        dotAdded = true;
      } else {
        finalVal = int.tryParse(current[i].key);
        if (i < initial.length) {
          initialVal = dotAdded ? 0 : int.tryParse(initial[i].key);
        }
      }
      final textStyle = current[i].value;

      if (initialVal != null && finalVal != null) {
        children.add(SingleDigit(initialValue: initialVal, finalValue: finalVal, textStyle: textStyle));
      } else {
        children.add(Text(current[i].key, style: textStyle));
      }
    }
    return children;
  }

  bool _hasDot(List<MapEntry<String, TextStyle>> l) =>
      l.firstWhere((en) => en.key == ('.'), orElse: () => null) != null;

  bool _equalDotIndex(List<MapEntry<String, TextStyle>> l1, List<MapEntry<String, TextStyle>> l2) {
    if (!_hasDot(l1) && !_hasDot(l2)) {
      return true;
    } else if (_hasDot(l1) && _hasDot(l2)) {
      final l1DotIdx = l1.indexWhere((en) => en.key == '.');
      final l2DotIdx = l2.indexWhere((en) => en.key == '.');
      return l1DotIdx == l2DotIdx;
    }
    return false;
  }

  Size _getOdometerSize() {
    var w = 0.0;
    var h = 0.0;
    textRuns.forEach((r) {
      Characters(r.currentText).forEach((c) {
        final size = TextRun.getSingleDigitSize('9', textStyle);
        w += size.width;
        if (size.height > h) {
          h = size.height;
        }
      });
    });

    return Size(w + 6, h);
  }
}
