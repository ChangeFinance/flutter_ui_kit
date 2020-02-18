import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../color.dart';

enum AmountDecoration {
  NO,
  BADGE,
  CROSS_OUT
}

class TransactionListItem extends StatelessWidget {
  final Function onPressed;
  final String amount;
  final String secondAmount;
  final Widget transactionIcon;
  final String title;
  final String subTitle;
  final AmountDecoration amountDecoration;
  final AmountDecoration secondAmountDecoration;
  final bool withDivider;

  static const paddingsAndIcon = 120.0;
  static const minRowWidth = 320.0;

  const TransactionListItem({
    @required this.onPressed,
    @required this.amount,
    @required this.transactionIcon,
    @required this.title,
    @required this.subTitle,
    this.secondAmount,
    this.amountDecoration = AmountDecoration.NO,
    this.secondAmountDecoration = AmountDecoration.NO,
    this.withDivider = false,
    Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width - MediaQuery.of(context).padding.horizontal;
    return GestureDetector(
        onTap: onPressed,
        child: Container(
            decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: withDivider ? 1.0 : 0.0, color: withDivider ? AppColor.lightestGrey : AppColor.deepWhite),
                )
            ),
            alignment: Alignment.centerLeft,
            width: screenWidth,
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
                child: _body(context, screenWidth)
            )
        ));
  }

  Widget _body(BuildContext context, double screenWidth) {
    final maxAmountWidth = screenWidth - 200;
    final amountFieldWidth = _amountFieldWidth();

    final width = amountFieldWidth < maxAmountWidth ? amountFieldWidth : maxAmountWidth;
    final maxTitleWidth = screenWidth - paddingsAndIcon - width;

    var minTitleWidth = _titleTextSize(title, _titleTextStyle(), maxTitleWidth).width;
    final minSubTitleWidth = _textSize(subTitle, _semiGreyTextStyle()).width;
    if (minSubTitleWidth < maxTitleWidth &&  minSubTitleWidth > minTitleWidth) {
      minTitleWidth = minSubTitleWidth;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            transactionIcon,
            const SizedBox(width: 16.0,),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _getTitle(maxTitleWidth, minTitleWidth),
                  const SizedBox(width: 16.0,),
                  _getAmount(amountFieldWidth, maxAmountWidth)
                ],
              ),
            )
          ],
        ),
        const SizedBox(width: 4.0,),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const SizedBox(width: 40.0,),
            Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _getSubTitle(maxTitleWidth, minTitleWidth),
                    const SizedBox(width: 16.0,),
                    secondAmount != null ? _getSecondAmount(amountFieldWidth, maxAmountWidth) : Container()
                  ],
                )),
          ],
        )
      ],
    );
  }

  double _amountFieldWidth() {
    var textBoxForAmountWidth = _textSize(amount, _amountStyle()).width;
    if (amountDecoration == AmountDecoration.BADGE) {
      textBoxForAmountWidth = textBoxForAmountWidth + 16.0;
    }

    if (secondAmount == null || secondAmount.isEmpty) {
      return textBoxForAmountWidth;
    }

    final textBoxForSecondAmountWidth = _textSize(secondAmount, _secondAmountStyle()).width;
    return textBoxForAmountWidth > textBoxForSecondAmountWidth
        ? textBoxForAmountWidth : textBoxForSecondAmountWidth;
  }

  TextStyle _amountStyle() {
    if (amountDecoration == AmountDecoration.CROSS_OUT) {
      return _semiGreyTextStyle().copyWith(decoration: TextDecoration.lineThrough);
    }

    return amountDecoration == AmountDecoration.NO
        ? _blackTextStyle()
        : _blackTextStyle().copyWith(color: AppColor.deepGreen);
  }

  TextStyle _secondAmountStyle() {
    return secondAmountDecoration == AmountDecoration.NO
        ? _semiGreyTextStyle()
        : _semiGreyTextStyle().copyWith(decoration: TextDecoration.lineThrough);
  }

  TextStyle _titleTextStyle() {
    return amountDecoration == AmountDecoration.CROSS_OUT ? _semiGreyTextStyle() : _blackTextStyle();
  }

  Widget _getTitle(double maxWidth, double minWidth) {
    return Container(
      width: minWidth,
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Text(title,
        textAlign: TextAlign.left,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: _titleTextStyle(),),
    );
  }

  Widget _getSubTitle(double maxWidth, double minWidth) {
    return Container(
        width: minWidth,
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Text(subTitle,
          textAlign: TextAlign.left,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: _semiGreyTextStyle(),));
  }

  Size _textSize(String text, TextStyle style) {
    final textPainter = TextPainter(
        text: TextSpan(text: text, style: style), maxLines: 1, textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  Size _titleTextSize(String text, TextStyle style, double maxWidth) {
    final textPainter = TextPainter(
        text: TextSpan(text: text, style: style), maxLines: 2, textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: maxWidth);
    return textPainter.size;
  }

  Widget _getAmount(double amountFieldWidth, double maxAmountWidth) {
    final textWidget = Container(
        width: amountFieldWidth,
        constraints: BoxConstraints(maxWidth: maxAmountWidth),
        child: Text(amount,
          textAlign: TextAlign.right,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: _amountStyle(),)
    );

    return amountDecoration == AmountDecoration.BADGE
        ? Container(
          decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            color: AppColor.greenLight),
          width: amountFieldWidth,
          constraints: BoxConstraints(maxWidth: maxAmountWidth),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(amount,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: _amountStyle(),),
          ),)
        : textWidget;
  }

  Widget _getSecondAmount(double amountFieldWidth, double maxAmountWidth) {
    return Container(
        width: amountFieldWidth,
        constraints: BoxConstraints(maxWidth: maxAmountWidth),
        child: Text(secondAmount,
          textAlign: TextAlign.right,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: _secondAmountStyle(),)
    );
  }

  TextStyle _semiGreyTextStyle() {
    return TextStyle(
        height: 1.5,
        fontSize: 16.0,
        fontFamily: 'Circular',
        fontWeight: FontWeight.normal,
        letterSpacing: 0.02,
        color: AppColor.semiGrey);
  }

  TextStyle _blackTextStyle() {
    return TextStyle(
        height: 1.5,
        fontSize: 16.0,
        fontFamily: 'Circular',
        fontWeight: FontWeight.normal,
        letterSpacing: 0.02,
        color: AppColor.deepBlack);
  }
}
