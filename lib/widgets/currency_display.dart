import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/theme.dart';
import 'package:intl/intl.dart';

import '../text.dart';

enum CurrencyDisplaySize { small, large }

class CurrencyDisplay extends StatelessWidget {
  final bool displayAsPrefix;
  final String currencySymbol;
  final String amount;
  final CurrencyDisplaySize size;
  final bool showCursor;

  static final TextStyle _smallTextStyle =
      theme.textTheme.body2.copyWith(color: AppColor.semiGrey);

  static NumberFormat get numberFormatter => NumberFormat('######.##');
  static NumberFormat get smallNumberFormatter => NumberFormat('#.######');

  CurrencyDisplay(
      {@required this.currencySymbol,
      this.amount,
      this.size = CurrencyDisplaySize.large,
      this.showCursor = true,
      this.displayAsPrefix = true});

  static const TextStyle _tickerStyle = TextStyle(
      fontSize: 38.0,
      fontFamily: 'Circular',
      fontWeight: FontWeight.bold,
      letterSpacing: 0,
      textBaseline: TextBaseline.alphabetic,
      color: AppColor.deepBlack);

  TextStyle get textStyle =>
      size == CurrencyDisplaySize.large ? AppText.header0 : _smallTextStyle;

  TextStyle get tickerTextStyle =>
      size == CurrencyDisplaySize.large ? _tickerStyle : _smallTextStyle;

  double get cursorHeight => size == CurrencyDisplaySize.large ? 30 : 18;

  Color get cursorColor => size == CurrencyDisplaySize.large
      ? AppColor.deepBlack
      : AppColor.semiGrey;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    if (displayAsPrefix) {
      children.add(Text(currencySymbol, maxLines: 1, style: textStyle));
      children.add(Text(_getAmount(),
          style: textStyle, maxLines: 1,));
      if (showCursor) {
        children.add(_Cursor(cursorHeight: cursorHeight, cursorColor: cursorColor));
      }
    } else {
      children.add(new Align(
          alignment: Alignment.bottomCenter,
          child: Text(_getAmount(),
            style: textStyle, maxLines: 1, textAlign: TextAlign.end)));
      if (showCursor) {
        children.add(_Cursor(cursorHeight: cursorHeight, cursorColor: cursorColor));
      }
      children.add(new Align(
        alignment: Alignment.bottomCenter,
        child: Text(' $currencySymbol', maxLines: 1, style: tickerTextStyle, textAlign: TextAlign.end,)));
    }

    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: children),
      ),
    );
  }

  String _getAmount() {
    if (size == CurrencyDisplaySize.small) {
      if (!amount.contains('.') && amount.isNotEmpty) {
        return '$amount.0';
      }
    }

    return amount;
  }
}

class _Cursor extends StatefulWidget {
  final double cursorHeight;
  final Color cursorColor;

  _Cursor({this.cursorHeight = 30, this.cursorColor = AppColor.deepBlack});

  @override
  __CursorState createState() => __CursorState();
}

class __CursorState extends State<_Cursor> with TickerProviderStateMixin {
  bool _show = true;
  Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        _show = !_show;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: _show ? 1 : 0,
        child: Container(
          margin: const EdgeInsets.only(left: 1),
          width: 1.5,
          height: widget.cursorHeight,
          color: widget.cursorColor,
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
