import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/theme.dart';
import 'package:intl/intl.dart';

enum CurrencyDisplaySize { small, large }

class CurrencyDisplay extends StatelessWidget {
  final bool isNativeCurrency;
  final String currencySymbol;
  final String amount;
  final CurrencyDisplaySize size;
  final bool showCursor;

  static final TextStyle _largeTextStyle =
      theme.textTheme.display4.copyWith(color: AppColor.deepBlack);
  static final TextStyle _smallTextStyle =
      theme.textTheme.body2.copyWith(color: AppColor.semiGrey);
  static final TextStyle _largeCursorStyle = TextStyle(
      color: AppColor.deepBlack, fontSize: 45, fontWeight: FontWeight.w100);
  static final TextStyle _smallCursorStyle =
      _largeCursorStyle.copyWith(color: AppColor.semiGrey, fontSize: 12);

  static NumberFormat get numberFormatter => NumberFormat('######.##');
  static NumberFormat get smallNumberFormatter => NumberFormat('#.######');

  CurrencyDisplay(
      {@required this.currencySymbol,
      this.amount,
      this.size = CurrencyDisplaySize.large,
      this.showCursor = true,
      this.isNativeCurrency = true});

  TextStyle get textStyle =>
      size == CurrencyDisplaySize.large ? _largeTextStyle : _smallTextStyle;

  TextStyle get cursorStyle =>
      size == CurrencyDisplaySize.large ? _largeCursorStyle : _smallCursorStyle;

  double get cursorHeight => size == CurrencyDisplaySize.large ? 35 : 18;

  Color get cursorColor => size == CurrencyDisplaySize.large
      ? AppColor.deepBlack
      : AppColor.semiGrey;

  double get maxHeight => size == CurrencyDisplaySize.large ? 50 : 25;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    if (isNativeCurrency) {
      children.add(Text(currencySymbol, maxLines: 1, style: textStyle));
      children.add(ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 200),
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(_getAmount(),
                style: textStyle, overflow: TextOverflow.clip)),
      ));
      children.add(showCursor
          ? _Cursor(cursorHeight: cursorHeight, cursorColor: cursorColor)
          : Container());
    } else {
      children.add(ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 250),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Text(_getAmount(),
                    style: textStyle, overflow: TextOverflow.clip),
                showCursor
                    ? _Cursor(cursorHeight: cursorHeight, cursorColor: cursorColor)
                    : Container(),
                SizedBox(width: size == CurrencyDisplaySize.large ? 10 : 5),
                Text(currencySymbol, maxLines: 1, style: textStyle),
              ],
            ),

          )));
    }

    return Container(
      constraints: BoxConstraints(maxWidth: 300, maxHeight: maxHeight),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
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

  _Cursor({this.cursorHeight = 35, this.cursorColor = AppColor.deepBlack});

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
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: _show ? 1 : 0,
      child: Container(
        margin: const EdgeInsets.only(left: 1),
        width: 1.5,
        height: widget.cursorHeight,
        color: widget.cursorColor,
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
