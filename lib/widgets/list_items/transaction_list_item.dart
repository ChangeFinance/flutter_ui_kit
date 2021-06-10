import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../color.dart';

enum AmountDecoration { NO, BADGE, CROSS_OUT }

class TransactionListItem extends StatelessWidget {
  final Function? onPressed;
  final String? amount;
  final String? secondAmount;
  final Widget transactionIcon;
  final String? title;
  final String? subTitle;
  final AmountDecoration amountDecoration;
  final AmountDecoration secondAmountDecoration;
  final bool? withDivider;

  static const paddingsAndIcon = 120.0;
  static const minRowWidth = 320.0;

  const TransactionListItem(
      { required this.amount,
        required this.transactionIcon,
        required this.title,
        required this.subTitle,
        this.onPressed,
        this.secondAmount,
        this.amountDecoration = AmountDecoration.NO,
        this.secondAmountDecoration = AmountDecoration.NO,
        this.withDivider = false,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fixedTitle = title!.replaceAll(RegExp(' +'), ' ');
    final screenWidth = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.horizontal;
    return GestureDetector(
        onTap: onPressed as void Function()?,
        child: Container(
            decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      width: withDivider! ? 1.0 : 0.0,
                      color:
                      withDivider! ? AppColor.lightestGrey : AppColor.deepWhite),
                )),
            alignment: Alignment.centerLeft,
            width: screenWidth,
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: _body(context, screenWidth, fixedTitle))));
  }

  Widget _body(BuildContext context, double screenWidth, String fixedTitle) {
    final maxAmountWidth = screenWidth - 160;
    final amountFieldWidth = _amountFieldWidth(context).toDouble();

    final width = amountFieldWidth < maxAmountWidth ? amountFieldWidth : maxAmountWidth;
    final maxTitleWidth = screenWidth - paddingsAndIcon - width;

    var minTitleWidth =
        _titleTextSize(fixedTitle, _titleTextStyle(), maxTitleWidth).width;
    final minSubTitleWidth = _textSize(subTitle, _semiGreyTextStyle()).width;
    if (minSubTitleWidth < maxTitleWidth && minSubTitleWidth > minTitleWidth) {
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
            Padding(
              padding: const EdgeInsets.only(top: 1.0),
              child: transactionIcon,
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _getTitle(fixedTitle, maxTitleWidth, minTitleWidth),
                  const SizedBox(
                    width: 16.0,
                  ),
                  _getAmount(amountFieldWidth, maxAmountWidth)
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          width: 4.0,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const SizedBox(
              width: 40.0,
            ),
            Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _getSubTitle(maxTitleWidth, minTitleWidth),
                    const SizedBox(
                      width: 16.0,
                    ),
                    secondAmount != null
                        ? _getSecondAmount(amountFieldWidth, maxAmountWidth)
                        : Container()
                  ],
                )),
          ],
        )
      ],
    );
  }

  TextBox _calcTextBox(BuildContext context, String? text, TextStyle style) {
    final textWidget = TextSpan(text: text, style: style);
    // ignore: avoid_as
    final richTextWidget = Text.rich(textWidget).build(context) as RichText;
    final renderObject = richTextWidget.createRenderObject(context);
    renderObject.maxLines = 1;
    renderObject.overflow = TextOverflow.ellipsis;
    renderObject.layout(const BoxConstraints(minWidth: 120, maxWidth: double.infinity));
    final lastBox = renderObject
        .getBoxesForSelection(TextSelection(
        baseOffset: 0, extentOffset: textWidget.toPlainText().length))
        .last;
    return lastBox;
  }

  int _roundWidth(double value) {
    return (value + 1).round();
  }

  int _amountFieldWidth(BuildContext context) {
    final size = _calcTextBox(context, amount, _amountStyle());
    var textBoxForAmountWidth = _roundWidth(size.right - size.left) + 2;
    if (amountDecoration == AmountDecoration.BADGE) {
      textBoxForAmountWidth = textBoxForAmountWidth + 16;
    } else {
      textBoxForAmountWidth = textBoxForAmountWidth + 8;
    }

    if (secondAmount == null || secondAmount!.isEmpty) {
      return textBoxForAmountWidth;
    }

    final size1 = _calcTextBox(context, secondAmount, _amountStyle());
    final textBoxForSecondAmountWidth =
        _roundWidth(size1.right - size1.left) + 10;
    return textBoxForAmountWidth > textBoxForSecondAmountWidth
        ? textBoxForAmountWidth
        : textBoxForSecondAmountWidth;
  }

  TextStyle _amountStyle() {
    if (amountDecoration == AmountDecoration.CROSS_OUT) {
      return _semiGreyTextStyle().copyWith(decoration: TextDecoration.lineThrough);
    }

    return amountDecoration == AmountDecoration.NO
        ? _blackTextStyle()
        : _blackTextStyle().copyWith(color: AppColor.deepGreen, height: 1.0);
  }

  TextStyle _secondAmountStyle() {
    return secondAmountDecoration == AmountDecoration.NO
        ? _semiGreyTextStyle()
        : _semiGreyTextStyle().copyWith(decoration: TextDecoration.lineThrough);
  }

  TextStyle _titleTextStyle() {
    return amountDecoration == AmountDecoration.CROSS_OUT
        ? _greyTextStyle()
        : _blackTextStyle();
  }

  Widget _getTitle(String fixedTitle, double maxWidth, double minWidth) {
    return Padding(
        padding: const EdgeInsets.only(top: 2),
        child: Container(
          width: minWidth,
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Text(
            fixedTitle,
            textAlign: TextAlign.left,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: _titleTextStyle(),
          ),
        ));
  }

  Widget _getSubTitle(double maxWidth, double minWidth) {
    return Container(
        width: minWidth,
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Text(
          subTitle!,
          textAlign: TextAlign.left,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: _semiGreyTextStyle(),
        ));
  }

  Size _textSize(String? text, TextStyle style) {
    final textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  Size _titleTextSize(String text, TextStyle style, double maxWidth) {
    final textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 2,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: maxWidth);
    return textPainter.size;
  }

  Widget _getAmount(double amountFieldWidth, double maxAmountWidth) {
    final textWidget = Container(
        width: amountFieldWidth,
        constraints: BoxConstraints(maxWidth: maxAmountWidth),
        child: Padding(
            padding: const EdgeInsets.only(top: 2.0, right: 8.0),
            child: Text(amount!,
                textAlign: TextAlign.right,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: _amountStyle())));

    return amountDecoration == AmountDecoration.BADGE
        ? Container(
        height: 24.0,
        decoration: const BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            color: AppColor.greenLight),
        width: amountFieldWidth,
        constraints: BoxConstraints(maxWidth: maxAmountWidth, minWidth: 60.0),
        child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 3.0),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: amountFieldWidth - 16,
                      constraints: BoxConstraints(maxWidth: maxAmountWidth - 16),
                      child: Padding(
                          padding: const EdgeInsets.only(bottom: 1.0, right: 0.0),
                          child: Text(
                            amount!,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: _amountStyle(),
                          )))
                ])))
        : textWidget;
  }

  Widget _getSecondAmount(double amountFieldWidth, double maxAmountWidth) {
    return Container(
        width: amountFieldWidth,
        constraints: BoxConstraints(maxWidth: maxAmountWidth),
        child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              secondAmount!,
              textAlign: TextAlign.right,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: _secondAmountStyle(),
            )));
  }

  TextStyle _semiGreyTextStyle() {
    return const TextStyle(
        height: 1.428,
        fontSize: 14.0,
        fontFamily: 'DINNextLTPro',
        fontWeight: FontWeight.normal,
        letterSpacing: 0.02,
        color: AppColor.semiGrey);
  }

  TextStyle _blackTextStyle() {
    return const TextStyle(
        height: 1.428,
        fontSize: 14.0,
        fontFamily: 'DINNextLTPro',
        fontWeight: FontWeight.normal,
        letterSpacing: 0.02,
        color: AppColor.deepBlack);
  }

  TextStyle _greyTextStyle() {
    return const TextStyle(
        height: 1.428,
        fontSize: 14.0,
        fontFamily: 'DINNextLTPro',
        fontWeight: FontWeight.normal,
        letterSpacing: 0.02,
        color: AppColor.semiGrey);
  }
}
