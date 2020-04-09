import 'package:flutter/material.dart';
import 'package:characters/characters.dart';
import 'package:flutter_ui_kit/widgets/odometer/single_digit.dart';
import 'package:flutter_ui_kit/widgets/odometer/text_run.dart';

class Odometer extends StatelessWidget {
  final List<TextRun> textRuns;

  Odometer(this.textRuns, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = _getSize();
    return SizedOverflowBox(
      size: size,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: _getChildren(),
      ),
    );
  }

  List<Widget> _getChildren() {
    final currentTextRunChars = <MapEntry<String, TextStyle>>[];
    final initialTextRunChars = <MapEntry<String, TextStyle>>[];

    for (final run in textRuns) {
      for (final char in Characters(run.currentText)) {
        currentTextRunChars.add(MapEntry(char, run.textStyle));
      }

      for (final char in Characters(run.initialText)) {
        initialTextRunChars.add(MapEntry(char, run.textStyle));
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
        children.add(SingleDigit(initialValue: initialVal, finalValue: finalVal, textStyle: textStyle, key: UniqueKey()));
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
        initialVal = dotAdded ? 0 : int.tryParse(initial[i].key);
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

  Size _getSize() {
    var w = 0.0;
    var h = 0.0;
    textRuns.forEach((r) {
      final size = TextRun.getSingleDigitSize('9', r.textStyle);
      w += size.width;
      if (size.height > h) {
        h = size.height;
      }
    });

    return Size(w, h);
  }
}
