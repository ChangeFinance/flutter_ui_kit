import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/story_book/expandable_story.dart';
import 'package:flutter_ui_kit/widgets/change_app_icons.dart';

class IconsStory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _enabledIcons(),
          _disabledIcons()
        ],
      ),
    );
  }

  Widget _enabledIcons() {
    return ExpandableStory(
      title: 'Enabled Icons',
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20.0),
        crossAxisSpacing: 10.0,
        crossAxisCount: 3,
        shrinkWrap: true,
        children: <Widget>[
          _atmWithdrawEnabled(),
          _roundupEnabled(),
          _bitcoinToSavingsEnabled(),
          _withdrawEnabled(),
          _depositEnabled(),
          _sellEnabled(),
          _buyEnabled(),
          _feesEnabled(),
          _cryptoConversionEnabled(),
          _cardPaymentEnabled(),
          _walletEnabled()
        ],
      ),
    );
  }

  Widget _disabledIcons() {
    return ExpandableStory(
      title: 'Disabled Icons',
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20.0),
        crossAxisSpacing: 10.0,
        crossAxisCount: 3,
        shrinkWrap: true,
        children: <Widget>[
          _atmWithdrawDisabled(),
          _roundupDisabled(),
          _bitcoinToSavingsDisabled(),
          _withdrawDisabled(),
          _depositDisabled(),
          _sellDisabled(),
          _buyDisabled(),
          _feesDisabled(),
          _cryptoConversionDisabled(),
          _cardPaymentDisabled(),
          _walletDisabled()
        ],
      ),
    );
  }

  Widget _roundupEnabled() {
    return Card(
        child: Column(
          children: <Widget>[
            Center(child: ChangeAppIcons.roundup),
            const Text('Round Up')
          ],
        )
    );
  }


  Widget _atmWithdrawEnabled() {
    return Card(
      child: Column(
        children: <Widget>[
          Center(child: ChangeAppIcons.atm_withdraw),
          const Text('ATM Withdraw')
        ],
      )
    );
  }

  Widget _bitcoinToSavingsEnabled() {
    return Card(
        child: Column(
          children: <Widget>[
            Center(child: ChangeAppIcons.bitcoin_to_savings),
            const Text('Bitcoin 2 Savings')
          ],
        )
    );
  }

  Widget _withdrawEnabled() {
    return Card(
        child: Column(
          children: <Widget>[
            Center(child: ChangeAppIcons.withdraw),
            const Text('Withdraw')
          ],
        )
    );
  }

  Widget _depositEnabled() {
    return Card(
        child: Column(
          children: <Widget>[
            Center(child: ChangeAppIcons.deposit),
            const Text('Deposit')
          ],
        )
    );
  }

  Widget _sellEnabled() {
    return Card(
        child: Column(
          children: <Widget>[
            Center(child: ChangeAppIcons.sell),
            const Text('Sell')
          ],
        )
    );
  }

  Widget _buyEnabled() {
    return Card(
        child: Column(
          children: <Widget>[
            Center(child: ChangeAppIcons.buy),
            const Text('Buy')
          ],
        )
    );
  }

  Widget _feesEnabled() {
    return Card(
        child: Column(
          children: <Widget>[
            Center(child: ChangeAppIcons.fees),
            const Text('Fees')
          ],
        )
    );
  }

  Widget _cryptoConversionEnabled() {
    return Card(
        child: Column(
          children: <Widget>[
            Center(child: ChangeAppIcons.convert),
            const Text('Crypto Conversion')
          ],
        )
    );
  }

  Widget _cardPaymentEnabled() {
    return Card(
        child: Column(
          children: <Widget>[
            Center(child: ChangeAppIcons.card_payment),
            const Text('Card Payment')
          ],
        )
    );
  }

  Widget _walletEnabled() {
    return Card(
        child: Column(
          children: <Widget>[
            Center(child: ChangeAppIcons.wallet),
            const Text('Wallet')
          ],
        )
    );
  }

  Widget _roundupDisabled() {
    return Card(
        child: Column(
          children: <Widget>[
            Center(child: ChangeAppIcons.roundup_disabled),
            const Text('Round up')
          ],
        )
    );
  }


  Widget _atmWithdrawDisabled() {
    return Card(
        child: Column(
          children: <Widget>[
            Center(child: ChangeAppIcons.atm_withdraw_disabled),
            const Text('ATM Withdraw')
          ],
        )
    );
  }

  Widget _bitcoinToSavingsDisabled() {
    return Card(
        child: Column(
          children: <Widget>[
            Center(child: ChangeAppIcons.bitcoin_to_savings_disabled),
            const Text('Bitcoin 2 Savings')
          ],
        )
    );
  }

  Widget _withdrawDisabled() {
    return Card(
        child: Column(
          children: <Widget>[
            Center(child: ChangeAppIcons.withdraw_disabled),
            const Text('Withdraw')
          ],
        )
    );
  }

  Widget _depositDisabled() {
    return Card(
        child: Column(
          children: <Widget>[
            Center(child: ChangeAppIcons.deposit_disabled),
            const Text('Deposit')
          ],
        )
    );
  }

  Widget _sellDisabled() {
    return Card(
        child: Column(
          children: <Widget>[
            Center(child: ChangeAppIcons.sell_disabled),
            const Text('Sell')
          ],
        )
    );
  }

  Widget _buyDisabled() {
    return Card(
        child: Column(
          children: <Widget>[
            Center(child: ChangeAppIcons.buy_disabled),
            const Text('Buy')
          ],
        )
    );
  }

  Widget _feesDisabled() {
    return Card(
        child: Column(
          children: <Widget>[
            Center(child: ChangeAppIcons.fees_disabled),
            const Text('Fees')
          ],
        )
    );
  }

  Widget _cryptoConversionDisabled() {
    return Card(
        child: Column(
          children: <Widget>[
            Center(child: ChangeAppIcons.convert_disabled),
            const Text('Crypto Conversion')
          ],
        )
    );
  }

  Widget _cardPaymentDisabled() {
    return Card(
        child: Column(
          children: <Widget>[
            Center(child: ChangeAppIcons.card_payment_disabled),
            const Text('Card Payment')
          ],
        )
    );
  }

  Widget _walletDisabled() {
    return Card(
        child: Column(
          children: <Widget>[
            Center(child: ChangeAppIcons.wallet_disabled),
            const Text('Wallet')
          ],
        )
    );
  }
}