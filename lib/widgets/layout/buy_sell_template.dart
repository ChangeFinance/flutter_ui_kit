import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/theme.dart';
import 'package:flutter_ui_kit/widgets/currency_display.dart';
import 'package:flutter_ui_kit/widgets/currency_switcher.dart';
import 'package:flutter_ui_kit/widgets/layout/app_bar.dart';
import 'package:flutter_ui_kit/widgets/layout/page_template.dart';
import 'package:flutter_ui_kit/widgets/text/numpad_text.dart';

class BuySellTemplate extends StatefulWidget {
  final String mainTitle;
  final String subTitle;
  final Widget action;
  final String showcaseLabel;
  final Widget showcase;
  final List<String> switcherLabels;
  final List<String> currencySymbols;
  final int numpadMaxLength;
  final String errorText;
  final Function(int) onSwitched;
  final double Function(double) primaryConverter;
  final double Function(double) reverseConverter;
  final Function(MapEntry<double, double>) amountChanged;

  const BuySellTemplate(
      {this.action,
      this.mainTitle,
      this.subTitle,
      this.showcaseLabel,
      this.showcase,
      this.switcherLabels,
      this.currencySymbols,
      this.numpadMaxLength = 0,
      this.errorText = '',
      this.onSwitched,
      this.primaryConverter,
      this.reverseConverter,
      this.amountChanged});

  @override
  _BuySellTemplateState createState() => _BuySellTemplateState();
}

class _BuySellTemplateState extends State<BuySellTemplate> {
  List<String> get switcherLabels => widget.switcherLabels;

  List<String> get currencySymbols => widget.currencySymbols;

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

  String _currText = '';
  bool _needNumPadUpdate = false;
  int _switcherIndex = 0;
  String primaryAmount = '';
  String secondaryAmount = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return PageTemplate(
      appBar: MainAppBar(
        leadingWidget: const CloseButton(),
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(widget.mainTitle,
                style: theme.display1.copyWith(color: AppColor.deepBlack),
                textAlign: TextAlign.left),
            const SizedBox(height: 5),
            Text(
              widget.subTitle,
              style: theme.body2.copyWith(color: AppColor.semiGrey),
            ),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        child: Column(
          children: <Widget>[
            Expanded(
              key: const Key('childExpandedContainer'),
              flex: 1,
              child: _buildContent(context),
            ),
            Padding(
                key: const Key('actionPadding'),
                padding: const EdgeInsets.only(bottom: 10, top: 10),
                child: widget.action),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10),
        CurrencySwitcher(
          symbols: currencySymbols,
          amounts: _getAmounts(),
          currencyLabels: switcherLabels,
          onSwitch: _onSwitch,
        ),
        Container(
          alignment: Alignment.center,
          child: Text(widget.errorText,
              textAlign: TextAlign.center,
              style: theme.textTheme.body2.copyWith(color: AppColor.red)),
        ),
        const SizedBox(height: 20),
        _buildShowcase(context),
        _buildNumPad(),
      ],
    );
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
    return Row(
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
