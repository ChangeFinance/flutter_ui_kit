import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/widgets/currency_display.dart';
import 'package:flutter_ui_kit/widgets/switcher_button.dart';

class CurrencySwitcher extends StatefulWidget {
  final List<String> symbols;
  final List<double> amounts;
  final List<String> currencyLabels;
  final Function(int) onSwitch;

  CurrencySwitcher(
      {@required this.symbols,
      @required this.currencyLabels,
      @required this.amounts,
      this.onSwitch})
      : assert(symbols != null && symbols.length == 2),
        assert(currencyLabels != null && currencyLabels.length == 2);

  @override
  _CurrencySwitcherState createState() => _CurrencySwitcherState();
}

class _CurrencySwitcherState extends State<CurrencySwitcher> {
  List<String> get symbols => widget.symbols;

  List<double> get amounts => widget.amounts;

  List<String> get labels => widget.currencyLabels;

  Function(int) get onSwitch => widget.onSwitch;

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[]
          ..add(_buildDisplay())
          ..toList()
          ..add(Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(child: Container()),
              SwitcherButton(
                labels: labels,
                onSwitch: _switch,
              ),
            ],
          )),
      ),
    );
  }

  Widget _buildDisplay() {
    if (amounts == null) {
      return CurrencyDisplay(
          currencySymbol: symbols[_currentIndex == 0 ? 1 : 0]);
    }

    Widget first = Container();
    Widget second = Container();

    if (amounts.isNotEmpty) {
      first = CurrencyDisplay(
          currencySymbol: symbols[1],
          amount: amounts[1],
          showCursor: _currentIndex == 0,
          size: _currentIndex == 0
              ? CurrencyDisplaySize.large
              : CurrencyDisplaySize.small);
    }
    if (amounts.length > 1) {
      second = CurrencyDisplay(
          currencySymbol: symbols[0],
          amount: amounts[0],
          showCursor: _currentIndex == 1,
          size: _currentIndex == 1
              ? CurrencyDisplaySize.large
              : CurrencyDisplaySize.small);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _currentIndex == 0 ? [first, second] : [second, first],
    );
  }

  void _switch(int index) {
    setState(() {
      _currentIndex = index;
      if (onSwitch != null) {
        onSwitch(index);
      }
    });
  }
}
