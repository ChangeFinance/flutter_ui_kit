import 'change_icon/change_icon.dart';
import 'change_icon/change_icon_data.dart';
import 'change_icon/change_icon_type.dart';

class ChangeAppIcons {
  ChangeAppIcons._();

  static const ChangeIcon atm_withdraw =
      ChangeIcon(const ChangeIconData('atm', ChangeIconType.enabled));

  static const ChangeIcon atm_withdraw_disabled =
      ChangeIcon(const ChangeIconData('atm', ChangeIconType.disabled));

  static const ChangeIcon buy =
      ChangeIcon(const ChangeIconData('buy', ChangeIconType.enabled));

  static const ChangeIcon buy_disabled =
      ChangeIcon(const ChangeIconData('buy', ChangeIconType.disabled));

  static const ChangeIcon card_payment =
      ChangeIcon(const ChangeIconData('card_payment', ChangeIconType.enabled));

  static const ChangeIcon card_payment_disabled = ChangeIcon(
    const ChangeIconData('card_payment', ChangeIconType.disabled),
  );

  static const ChangeIcon convert =
      ChangeIcon(const ChangeIconData('convert', ChangeIconType.enabled));

  static const ChangeIcon reward_enabled =
      ChangeIcon(const ChangeIconData('reward', ChangeIconType.enabled));

  static const ChangeIcon reward_disabled =
      ChangeIcon(const ChangeIconData('reward', ChangeIconType.disabled));

  static const ChangeIcon bonus_enabled =
      ChangeIcon(const ChangeIconData('bonus', ChangeIconType.enabled));

  static const ChangeIcon bonus_disabled =
      ChangeIcon(const ChangeIconData('bonus', ChangeIconType.disabled));

  static const ChangeIcon convert_disabled =
      ChangeIcon(const ChangeIconData('convert', ChangeIconType.disabled));

  static const ChangeIcon fees =
      ChangeIcon(const ChangeIconData('fees', ChangeIconType.enabled));

  static const ChangeIcon fees_disabled =
      ChangeIcon(const ChangeIconData('fees', ChangeIconType.disabled));

  static const ChangeIcon deposit =
      ChangeIcon(const ChangeIconData('deposit', ChangeIconType.enabled));

  static const ChangeIcon deposit_disabled =
      ChangeIcon(const ChangeIconData('deposit', ChangeIconType.disabled));

  static const ChangeIcon sell =
      ChangeIcon(const ChangeIconData('sell', ChangeIconType.enabled));

  static const ChangeIcon sell_disabled =
      ChangeIcon(const ChangeIconData('sell', ChangeIconType.disabled));

  static const ChangeIcon withdraw =
      ChangeIcon(const ChangeIconData('withdraw', ChangeIconType.enabled));

  static const ChangeIcon withdraw_disabled =
      ChangeIcon(const ChangeIconData('withdraw', ChangeIconType.disabled));

  static const ChangeIcon roundup =
      ChangeIcon(const ChangeIconData('roundup', ChangeIconType.enabled));

  static const ChangeIcon roundup_disabled =
      ChangeIcon(const ChangeIconData('roundup', ChangeIconType.disabled));

  static const ChangeIcon bitcoin_to_savings = ChangeIcon(
      const ChangeIconData('bitcoin_to_savings', ChangeIconType.enabled));

  static const ChangeIcon bitcoin_to_savings_disabled = ChangeIcon(
      const ChangeIconData('bitcoin_to_savings', ChangeIconType.disabled));

  static const ChangeIcon wallet =
      ChangeIcon(const ChangeIconData('wallet', ChangeIconType.enabled));

  static ChangeIcon walletSized(double width, double height) => ChangeIcon(
      const ChangeIconData(
        'wallet',
        ChangeIconType.enabled,
      ),
      width: width,
      height: height);

  static const ChangeIcon wallet_disabled =
      ChangeIcon(const ChangeIconData('wallet', ChangeIconType.disabled));

  static ChangeIcon walletDisabledSized(double width, double height) =>
      ChangeIcon(
          const ChangeIconData(
            'wallet',
            ChangeIconType.disabled,
          ),
          width: width,
          height: height);

  static const ChangeIcon prices =
      ChangeIcon(const ChangeIconData('prices', ChangeIconType.enabled));

  static ChangeIcon pricesSized(double width, double height) => ChangeIcon(
      const ChangeIconData(
        'prices',
        ChangeIconType.enabled,
      ),
      width: width,
      height: height);

  static const ChangeIcon prices_disabled =
      ChangeIcon(const ChangeIconData('prices', ChangeIconType.disabled));

  static ChangeIcon pricesDisabledSized(double width, double height) =>
      ChangeIcon(
          const ChangeIconData(
            'prices',
            ChangeIconType.disabled,
          ),
          width: width,
          height: height);

  static const ChangeIcon card =
      ChangeIcon(const ChangeIconData('card', ChangeIconType.enabled));

  static ChangeIcon cardSized(double width, double height) => ChangeIcon(
      const ChangeIconData(
        'card',
        ChangeIconType.enabled,
      ),
      width: width,
      height: height);

  static const ChangeIcon card_disabled =
      ChangeIcon(const ChangeIconData('card', ChangeIconType.disabled));

  static ChangeIcon cardDisabledSized(double width, double height) =>
      ChangeIcon(
          const ChangeIconData(
            'card',
            ChangeIconType.disabled,
          ),
          width: width,
          height: height);

  static const ChangeIcon nav_settings =
      ChangeIcon(const ChangeIconData('nav_settings', ChangeIconType.enabled));

  static ChangeIcon navSized(double width, double height) => ChangeIcon(
      const ChangeIconData(
        'nav_settings',
        ChangeIconType.enabled,
      ),
      width: width,
      height: height);

  static const ChangeIcon nav_settings_disabled =
      ChangeIcon(const ChangeIconData('nav_settings', ChangeIconType.disabled));

  static ChangeIcon navDisabledSized(double width, double height) => ChangeIcon(
      const ChangeIconData(
        'nav_settings',
        ChangeIconType.disabled,
      ),
      width: width,
      height: height);

  static const ChangeIcon arrow_forward =
      ChangeIcon(const ChangeIconData('arrow_forward', ChangeIconType.enabled));

  static const ChangeIcon arrow_back =
      ChangeIcon(const ChangeIconData('arrow_back', ChangeIconType.enabled));

  static const ChangeIcon invite =
      ChangeIcon(const ChangeIconData('invite', ChangeIconType.enabled));

  static ChangeIcon inviteSized(double width, double height) => ChangeIcon(
      const ChangeIconData(
        'invite',
        ChangeIconType.enabled,
      ),
      width: width,
      height: height);

  static const ChangeIcon invite_disabled =
      ChangeIcon(const ChangeIconData('invite', ChangeIconType.disabled));

  static ChangeIcon inviteDisabledSized(double width, double height) =>
      ChangeIcon(
          const ChangeIconData(
            'invite',
            ChangeIconType.disabled,
          ),
          width: width,
          height: height);

  static const ChangeIcon checkbox_checked = ChangeIcon(
      const ChangeIconData('checkbox_checked', ChangeIconType.enabled));

  static const ChangeIcon checkbox_unchecked = ChangeIcon(
      const ChangeIconData('checkbox_unchecked', ChangeIconType.enabled));

  static const ChangeIcon radio_checked =
      ChangeIcon(const ChangeIconData('radio_checked', ChangeIconType.enabled));

  static const ChangeIcon radio_unchecked = ChangeIcon(
      const ChangeIconData('radio_unchecked', ChangeIconType.enabled));

  static const ChangeIcon switch_arrow = ChangeIcon(
    const ChangeIconData('switch_arrow', ChangeIconType.enabled), height: 20, width: 20,
  );
}
