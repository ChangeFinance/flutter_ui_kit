import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/story_book/expandable_story.dart';
import 'package:flutter_ui_kit/widgets/change_app_icons.dart';

class Iconography extends StatelessWidget {
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
          _receivedBonusEnabled(),
          _receivedRewardEnabled(),
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
          _walletEnabled(),
          _pricesEnabled(),
          _cardEnabled(),
          _navSettingsEnabled(),
          _arrowForwardEnabled(),
          _arrowBackEnabled(),
          _inviteEnabled()
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
          _receivedBonusDisabled(),
          _receivedRewardDisabled(),
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
          _walletDisabled(),
          _pricesDisabled(),
          _cardDisabled(),
          _navSettingsDisabled(),
          _inviteDisabled(),
        ],
      ),
    );
  }

  Widget _roundupEnabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.invite),
            const Text('Invite')
          ],
        )
    );
  }

  Widget _inviteEnabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.roundup),
            const Text('Round Up')
          ],
        )
    );
  }


  Widget _atmWithdrawEnabled() {
    return Card(
      child: Column(
        children: const <Widget>[
          Center(child: ChangeAppIcons.atm_withdraw),
          const Text('ATM Withdraw')
        ],
      )
    );
  }


  Widget _receivedRewardEnabled() {
    return Card(
      child: Column(
        children: const <Widget>[
          Center(child: ChangeAppIcons.reward_enabled),
          const Text('Received reward')
        ],
      )
    );
  }

  Widget _receivedBonusEnabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.bonus_enabled),
            const Text('Received Bonus')
          ],
        )
    );
  }

  Widget _receivedBonusDisabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.bonus_disabled),
            const Text('Received Bonus')
          ],
        )
    );
  }

  Widget _receivedRewardDisabled() {
    return Card(
      child: Column(
        children: const <Widget>[
          Center(child: ChangeAppIcons.reward_disabled),
          const Text('Received reward')
        ],
      )
    );
  }

  Widget _bitcoinToSavingsEnabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.bitcoin_to_savings),
            const Text('Bitcoin 2 Savings')
          ],
        )
    );
  }

  Widget _withdrawEnabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.withdraw),
            const Text('Withdraw')
          ],
        )
    );
  }

  Widget _depositEnabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.deposit),
            const Text('Deposit')
          ],
        )
    );
  }

  Widget _sellEnabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.sell),
            Text('Sell')
          ],
        )
    );
  }

  Widget _buyEnabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.buy),
            const Text('Buy')
          ],
        )
    );
  }

  Widget _feesEnabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.fees),
            const Text('Fees')
          ],
        )
    );
  }

  Widget _cryptoConversionEnabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.convert),
            const Text('Crypto Conversion')
          ],
        )
    );
  }

  Widget _cardPaymentEnabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.card_payment),
            const Text('Card Payment')
          ],
        )
    );
  }

  Widget _walletEnabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.wallet),
            const Text('Wallet')
          ],
        )
    );
  }

  Widget _pricesEnabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.prices),
            const Text('Prices')
          ],
        )
    );
  }

  Widget _cardEnabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.card),
            const Text('Card')
          ],
        )
    );
  }

  Widget _navSettingsEnabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.nav_settings),
            const Text('Settings (Navigation)')
          ],
        )
    );
  }

  Widget _arrowForwardEnabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.arrow_forward),
            const Text('Arrow Forward')
          ],
        )
    );
  }

  Widget _arrowBackEnabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.arrow_back),
            const Text('Arrow Back')
          ],
        )
    );
  }

  Widget _roundupDisabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.roundup_disabled),
            const Text('Round up')
          ],
        )
    );
  }


  Widget _atmWithdrawDisabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.atm_withdraw_disabled),
            const Text('ATM Withdraw')
          ],
        )
    );
  }

  Widget _bitcoinToSavingsDisabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.bitcoin_to_savings_disabled),
            const Text('Bitcoin 2 Savings')
          ],
        )
    );
  }

  Widget _withdrawDisabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.withdraw_disabled),
            const Text('Withdraw')
          ],
        )
    );
  }

  Widget _depositDisabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.deposit_disabled),
            const Text('Deposit')
          ],
        )
    );
  }

  Widget _sellDisabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.sell_disabled),
            const Text('Sell')
          ],
        )
    );
  }

  Widget _buyDisabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.buy_disabled),
            const Text('Buy')
          ],
        )
    );
  }

  Widget _feesDisabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.fees_disabled),
            const Text('Fees')
          ],
        )
    );
  }

  Widget _cryptoConversionDisabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.convert_disabled),
            const Text('Crypto Conversion')
          ],
        )
    );
  }

  Widget _cardPaymentDisabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.card_payment_disabled),
            const Text('Card Payment')
          ],
        )
    );
  }

  Widget _walletDisabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.wallet_disabled),
            const Text('Wallet')
          ],
        )
    );
  }

  Widget _pricesDisabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.prices_disabled),
            const Text('Prices')
          ],
        )
    );
  }

  Widget _cardDisabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.card_disabled),
            const Text('Card')
          ],
        )
    );
  }

  Widget _inviteDisabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.invite_disabled),
            const Text('Invite')
          ],
        )
    );
  }

  Widget _navSettingsDisabled() {
    return Card(
        child: Column(
          children: const <Widget>[
            Center(child: ChangeAppIcons.nav_settings_disabled),
            const Text('Settings (Navigation)')
          ],
        )
    );
  }
}