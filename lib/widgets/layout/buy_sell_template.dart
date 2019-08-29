import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/theme.dart';
import 'package:flutter_ui_kit/widgets/currency_switcher.dart';
import 'package:flutter_ui_kit/widgets/layout/app_bar.dart';
import 'package:flutter_ui_kit/widgets/layout/page_template.dart';
import 'package:flutter_ui_kit/widgets/text/numpad_text.dart';
import 'package:intl/intl.dart';

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
  final Function(String) onNumpadChange;
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
      this.onNumpadChange,
      this.primaryConverter,
      this.reverseConverter,
      this.amountChanged});

  @override
  _BuySellTemplateState createState() => _BuySellTemplateState();
}

class _BuySellTemplateState extends State<BuySellTemplate> {
  List<String> get switcherLabels => widget.switcherLabels;

  List<String> get currencySymbols => widget.currencySymbols;

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

  String _numpadBuffer = '';

  // ignore: unused_field
  String _prevText = '';
  String _currText = '';
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
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Expanded(
              key: const Key('childExpandedContainer'),
              flex: 1,
              child: _buildContent(context),
            ),
            Padding(
                key: const Key('actionPadding'),
                padding: const EdgeInsets.all(10),
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
        const SizedBox(height: 20),
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
          decimalPlaces: 2,
          clearOnLongPress: true,
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

  List<double> _getAmounts() {
    final amounts = [primaryAmount, secondaryAmount]
        .map((s) => double.tryParse(s.replaceAll(',', '')) ?? 0)
        .toList();
    if (amountChanged != null) {
      amountChanged(MapEntry(amounts[0], amounts[1]));
    }
    return amounts;
  }

  void _onSwitch(int newIndex) {
    setState(() {
      _switcherIndex = newIndex;
      _numpadBuffer = newIndex == 0 ? secondaryAmount : primaryAmount;
    });
  }

  void _onNumpadChange(String text) {
    final numberFormatter = NumberFormat('###,###.##');
    final smallNumberFormatter = NumberFormat('#.######');
    String res;
    if (_currText.length < text.length) {
      final diff = textDiff(_currText, text);
      res = _switcherIndex == 0 ? secondaryAmount + diff : primaryAmount + diff;
    } else {
      res = removeChar(_switcherIndex == 0 ? secondaryAmount : primaryAmount);
    }

    setState(() {
      _prevText = _currText;
      _numpadBuffer = res;
      _currText = text;
      if (_switcherIndex == 0) {
        secondaryAmount = res;
        // convert
        final doubleVal =
            double.tryParse(secondaryAmount.replaceAll(',', '')) ?? 0;
        final converted = amountConverter(doubleVal);
        primaryAmount = converted >= 1
            ? numberFormatter.format(converted)
            : smallNumberFormatter.format(converted);
        print(primaryAmount);
      } else {
        primaryAmount = res;
        final doubleVal =
            double.tryParse(primaryAmount.replaceAll(',', '')) ?? 0;
        final converted = reverseConverter(doubleVal);
        secondaryAmount = converted >= 1
            ? numberFormatter.format(converted)
            : smallNumberFormatter.format(converted);
        print(secondaryAmount);
      }
    });

    print('Numpad value: $text');
    print('Buffer value: $_numpadBuffer');
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
