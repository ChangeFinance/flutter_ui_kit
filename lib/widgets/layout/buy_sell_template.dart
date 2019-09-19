import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/theme.dart';
import 'package:flutter_ui_kit/widgets/currency_display.dart';
import 'package:flutter_ui_kit/widgets/currency_switcher.dart';
import 'package:flutter_ui_kit/widgets/layout/app_bar.dart';
import 'package:flutter_ui_kit/widgets/layout/page_template.dart';
import 'package:flutter_ui_kit/widgets/text/numpad_text.dart';

import '../../text.dart';

class BuySellTemplate extends StatefulWidget {
  final String mainTitle;
  final String subTitle;
  final Widget action;
  final String showcaseLabel;
  final Widget showcase;
  final List<CurrencyInfo> currencyInfoList;
  final int numpadMaxLength;
  final String errorText;
  final Function(int) onSwitched;
  final double Function(double) primaryConverter;
  final double Function(double) reverseConverter;
  final Function(MapEntry<double, double>) amountChanged;
  final int flowStepsNumber;
  final int flowStep;
  final String walletBalance;

  const BuySellTemplate(
      {@required this.currencyInfoList,
        this.action,
      this.mainTitle,
      this.subTitle,
      this.showcaseLabel,
      this.showcase,
      this.numpadMaxLength = 0,
      this.errorText = '',
      this.onSwitched,
      this.primaryConverter,
      this.reverseConverter,
      this.amountChanged,
      this.flowStepsNumber = 0,
      this.flowStep = 0,
      this.walletBalance
      }): assert(currencyInfoList != null && currencyInfoList.length == 2);

  @override
  _BuySellTemplateState createState() => _BuySellTemplateState();
}

class _BuySellTemplateState extends State<BuySellTemplate> {
  static const _X_SMALL_SCREEN = 850;

  List<CurrencyInfo> get currencyInfoList => widget.currencyInfoList;

  Function(int) get onSwitched => widget.onSwitched;

  double Function(double) get amountConverter {
    if (widget.primaryConverter != null) {
      return widget.primaryConverter;
    }
    return (v) => v;
  }

  double Function(double) get reverseConverter {
    if (widget.reverseConverter != null) {
      return widget.reverseConverter;
    }
    return (v) => v;
  }

  Function(MapEntry<double, double>) get amountChanged => widget.amountChanged;

  String _currText = '0';
  bool _needNumPadUpdate = false;
  int _switcherIndex = 0;
  String primaryAmount = '0';
  String secondaryAmount = '0';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final bottomPadding = screenHeight > _X_SMALL_SCREEN ? 30.0 : 10.0;
    return PageTemplate(
      appBar: MainAppBar(
        leadingWidget: const CloseButton(),
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(widget.mainTitle,
                style: AppText.header3,
                textAlign: TextAlign.left),
            const SizedBox(height: 5),
            _subtitle(context),
          ],
        ),
        showProgress: true,
        flowStep: widget.flowStep,
        flowStepsNumber: widget.flowStepsNumber,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        child: Column(
          children: <Widget>[
            Expanded(
              key: const Key('childExpandedContainer'),
              flex: 1,
              child: _buildContent(context, screenHeight),
            ),
            Padding(
                key: const Key('actionPadding'),
                padding: EdgeInsets.only(bottom: bottomPadding, top: 10),
                child: widget.action),
          ],
        ),
      ),
    );
  }

  Widget _subtitle(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          final selected = _switcherIndex;
          _onSwitch(0);
          _updateState(widget.walletBalance);
          _onSwitch(selected);
        });
      },
      child: Text(
        widget.subTitle,
        style: AppText.body3.copyWith(color: AppColor.semiGrey),
      )
    );
  }

  Widget _buildContent(BuildContext context, double screenHeight) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: screenHeight > _X_SMALL_SCREEN ? 1 : 0,
          child: Container(),
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CurrencySwitcher(
                currencyInfoList: currencyInfoList,
                amounts: _getAmounts(),
                onSwitch: _onSwitch,
              ),
            ],
          ),
        ),
        Expanded(
          flex: screenHeight > _X_SMALL_SCREEN ? 1 : 0,
          child: _buildErrorText(),
        ),
        _buildShowcase(context),
        _buildNumPad(),
      ],
    );
  }

  Widget _buildErrorText() {
    if (widget.errorText != null && widget.errorText.isNotEmpty) {
      return Container(
          alignment: Alignment.topCenter,
          child: Text(widget.errorText,
              textAlign: TextAlign.center,
              style: theme.textTheme.body2.copyWith(color: AppColor.red)),
          );
    } else {
      return Container();
    }
  }

  Widget _buildNumPad() {
    return Container(
      height: 240,
      child: NumPadText(
          onChange: _onNumpadChange,
          decimalPlaces: 6,
          clearOnLongPress: true,
          startNumPadText: _currText,
          needNumPadTextUpdate: _needNumPadUpdate,
          textLengthLimit: widget.numpadMaxLength),
    );
  }

  Widget _buildShowcase(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            widget.showcaseLabel ?? '',
            style: theme.textTheme.body2.copyWith(color: AppColor.semiGrey),
          ),
          Expanded(child: Container()),
          widget.showcase ?? Container(),
        ],
      ),
    );
  }

  List<String> _getAmounts() {
    final amounts = [primaryAmount, secondaryAmount];
    if (amountChanged != null) {
    final amountList = amounts.map((s) => double.tryParse(s) ?? 0)
        .toList();
      amountChanged(MapEntry(amountList[0], amountList[1]));
    }
    return amounts;
  }

  void _onSwitch(int newIndex) {
    setState(() {
      _switcherIndex = newIndex;
      if (_switcherIndex == 0) {
        _currText = secondaryAmount;
      } else {
        _currText = primaryAmount;
      }

      _needNumPadUpdate = true;
    });
    if (onSwitched != null) {
      onSwitched(newIndex);
    }
  }

  void _updateState(String text) {
    _currText = text;
    final numberFormatter = CurrencyDisplay.numberFormatter;
    final smallNumberFormatter = CurrencyDisplay.smallNumberFormatter;
    if (_switcherIndex == 0) {
      secondaryAmount = text;
      // convert
      final doubleVal =
          double.tryParse(secondaryAmount) ?? 0;
      final converted = amountConverter(doubleVal);
      primaryAmount = converted >= 1
          ? numberFormatter.format(converted)
          : smallNumberFormatter.format(converted);
      print(primaryAmount);
    } else {
      primaryAmount = text;
      final doubleVal =
          double.tryParse(primaryAmount) ?? 0;
      final converted = reverseConverter(doubleVal);
      secondaryAmount = converted >= 1
          ? numberFormatter.format(converted)
          : smallNumberFormatter.format(converted);
      print(secondaryAmount);
    }
  }

  void _onNumpadChange(String text) {
    setState(() {
      _updateState(text);
    });

    _needNumPadUpdate = false;
  }

  String removeChar(String str) {
    if (str.isEmpty) {
      return '';
    }

    final list = str.split('').toList();
    list.removeAt(list.length - 1);
    return list.join();
  }

  String textDiff(String prevText, String currText) {
    final newChars = currText.substring(prevText.length);
    return newChars;
  }
}
