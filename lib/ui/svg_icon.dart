import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum SvgIconColor {
  theme,
  noColor,
}

class SvgIcon extends StatelessWidget {
  final String path;
  final SvgIconColor color;
  final Size size;

  const SvgIcon({
    @required this.path,
    this.color = SvgIconColor.theme,
    this.size,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = IconTheme.of(context);
    return SvgPicture.asset(
      path,
      color: color == SvgIconColor.theme ? theme.color : null,
      width: size?.width ?? theme.size,
      height: size?.height ?? theme.size,
    );
  }
}

class SvgNetworkIcon extends StatelessWidget {
  final String path;
  final SvgIconColor color;
  final Size size;

  const SvgNetworkIcon({
    @required this.path,
    this.color = SvgIconColor.theme,
    this.size,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = IconTheme.of(context);
    return SvgPicture.network(
      path,
      color: color == SvgIconColor.theme ? theme.color : null,
      width: size?.width ?? theme.size,
      height: size?.height ?? theme.size,
    );
  }
}


class SvgIconWithPadding extends StatelessWidget {
  final StatelessWidget icon;
  final EdgeInsets padding;

  const SvgIconWithPadding(this.icon, this.padding);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: icon,
    );
  }
}

class SvgIcons {
  SvgIcons._();


  static const SvgIcon timeline = SvgIcon(path: 'assets/icons/timeline.svg');
  static const SvgIcon payment = SvgIcon(path: 'assets/icons/payment.svg');
  static const SvgIcon compareArrows =
      SvgIcon(path: 'assets/icons/compare-arrows.svg');
  static const SvgIcon settings =
      SvgIcon(key: Key('settings-icon'), path: 'assets/icons/settings.svg');
  static const SvgIcon bitcoin = SvgIcon(path: 'assets/icons/bitcoin.svg');
  static const SvgIcon colourfulBitcoin = SvgIcon(
    path: 'assets/icons/bitcoin_colourful.svg',
    color: SvgIconColor.noColor,
  );
  static const SvgIcon ether = SvgIcon(path: 'assets/icons/ether.svg');
  static const SvgIcon colourfulEther = SvgIcon(
    path: 'assets/icons/ether_colourful.svg',
    color: SvgIconColor.noColor,
  );
  static const SvgIcon dash = SvgIcon(path: 'assets/icons/dash.svg');
  static const SvgIcon colourfulDash = SvgIcon(
    path: 'assets/icons/dash_colourful.svg',
    color: SvgIconColor.noColor
  );
  static const SvgIcon litecoin = SvgIcon(path: 'assets/icons/litecoin.svg');
  static const SvgIcon colourfulLitecoin = SvgIcon(
    path: 'assets/icons/litecoin_colourful.svg',
    color: SvgIconColor.noColor,
  );
  static const SvgIcon ripple = SvgIcon(path: 'assets/icons/ripple.svg');
  static const SvgIcon colourfulRipple = SvgIcon(
    path: 'assets/icons/ripple_colourful.svg',
    color: SvgIconColor.noColor,
  );
  static const SvgIcon eos = SvgIcon(path: 'assets/icons/eos.svg');
  static const SvgIcon colourfulEos = SvgIcon(
      path: 'assets/icons/eos_colorful.svg',
      color: SvgIconColor.noColor
  );
  static const SvgIcon stellar = SvgIcon(path: 'assets/icons/stellar.svg');
  static const SvgIcon colourfulStellar = SvgIcon(
      path: 'assets/icons/stellar_colourful.svg',
      color: SvgIconColor.noColor
  );
  static const SvgIcon bitcoinCash = SvgIcon(path: 'assets/icons/bitcoin_cash.svg');
  static const SvgIcon colourfulBitcoinCash = SvgIcon(
      path: 'assets/icons/bitcoin_cash_colorful.svg',
      color: SvgIconColor.noColor
  );
  static const SvgIcon coins = SvgIcon(path: 'assets/icons/coins.svg');
  static const SvgIcon tether = SvgIcon(
    path: 'assets/icons/tether.svg',
    color: SvgIconColor.noColor,
  );
  static const SvgIcon colourfulTether = SvgIcon(
    path: 'assets/icons/tether_colourful.svg',
    color: SvgIconColor.noColor,
  );
  static const SvgIcon colourfulChange = SvgIcon(
    path: 'assets/icons/change_colorful.svg',
    color: SvgIconColor.noColor,
  );
  static const SvgIcon intercom =
      SvgIcon(path: 'assets/icons/intercom.svg', color: SvgIconColor.noColor);
  static const SvgIcon back = SvgIcon(path: 'assets/icons/back.svg');
  static const SvgIcon forward = SvgIcon(path: 'assets/icons/forward.svg');
  static const SvgIcon eu = SvgIcon(
    path: 'assets/icons/eu.svg',
    color: SvgIconColor.noColor,
  );
  static const SvgIcon euro = SvgIcon(
    path: 'assets/icons/euro.svg',
    color: SvgIconColor.noColor,
  );
  static const SvgIcon rocket = SvgIcon(path: 'assets/icons/rocket.svg');
  static const SvgIcon arrowRight = SvgIcon(
    path: 'assets/images/verification/arrow-right.svg',
  );
  static const SvgIcon proofOfAddress = SvgIcon(
    path: 'assets/images/verification/proof-of-address.svg',
  );
  static const SvgIcon selfie = SvgIcon(
    path: 'assets/images/verification/selfie.svg',
  );
  static const SvgIcon document = SvgIcon(
    path: 'assets/images/verification/document.svg',
  );

  static const SvgIcon personalDetails = SvgIcon(
    path: 'assets/images/verification/personal-details.svg',
  );

  static SvgIcon passportBlue(Size size) => SvgIcon(
        path: 'assets/images/verification/passport-blue.svg',
        color: SvgIconColor.noColor,
        size: size,
      );

  static SvgIcon documentFrontSideBlue(Size size) => SvgIcon(
        path: 'assets/images/verification/document-front-side-blue.svg',
        color: SvgIconColor.noColor,
        size: size,
      );

  static SvgIcon documentBackSideBlue(Size size) => SvgIcon(
        path: 'assets/images/verification/document-back-side-blue.svg',
        color: SvgIconColor.noColor,
        size: size,
      );

  static SvgIcon proofOfAddressBlue(Size size) => SvgIcon(
        path: 'assets/images/verification/proof-of-address-blue.svg',
        color: SvgIconColor.noColor,
        size: size,
      );

  static SvgIcon selfieBlue(Size size) => SvgIcon(
        path: 'assets/images/verification/selfie-blue.svg',
        color: SvgIconColor.noColor,
        size: size,
      );

  static SvgIcon world(Size size) => SvgIcon(
        path: 'assets/images/verification/world.svg',
        color: SvgIconColor.noColor,
        size: size,
      );

  static SvgIcon birds(Size size) => SvgIcon(
        path: 'assets/images/verification/birds.svg',
        color: SvgIconColor.noColor,
        size: size,
      );

  static SvgIcon bank(Size size) => SvgIcon(
        path: 'assets/images/order/bank.svg',
        color: SvgIconColor.noColor,
        size: size,
      );

  static SvgIcon guyInTheLeaves(Size size) => SvgIcon(
    path: 'assets/images/order/leaves.svg',
    color: SvgIconColor.noColor,
    size: size,
  );

  static SvgIcon cardReorderProgress(Size size) => SvgIcon(
    path: 'assets/images/order/reorder_progress.svg',
    color: SvgIconColor.noColor,
    size: size,
  );

  static SvgIcon cardDeliveryProgress(Size size) => SvgIcon(
        path: 'assets/images/order/progress.svg',
        color: SvgIconColor.noColor,
        size: size,
      );

  static SvgIcon cardInsufficientBalance(Size size) => SvgIcon(
    path: 'assets/images/order/insufficient-balance.svg',
    color: SvgIconColor.noColor,
    size: size,
  );

  static SvgIcon cardElephants(Size size) => SvgIcon(
    path: 'assets/images/introscreens/card-elephants.svg',
    color: SvgIconColor.noColor,
    size: size,
  );

  static SvgIcon sheepJumpingOverFence(Size size) => SvgIcon(
        path: 'assets/images/order/lambs.svg',
        color: SvgIconColor.noColor,
        size: size,
      );

  static SvgIcon tailorMade(Size size) => SvgIcon(
        path: 'assets/images/survey/tailor.svg',
        color: SvgIconColor.noColor,
        size: size,
      );

  static SvgIcon wings(Size size) => SvgIcon(
        path: 'assets/images/order/wings.svg',
        color: SvgIconColor.noColor,
        size: size,
      );

  static SvgIcon successSpaceMan(Size size) => SvgIcon(
        path: 'assets/images/shared/success-space-man.svg',
        color: SvgIconColor.noColor,
        size: size,
      );

  static SvgIcon failureDroppedIceCream(Size size) => SvgIcon(
    path: 'assets/images/shared/failure-dropped-icecream.svg',
    color: SvgIconColor.noColor,
    size: size,
  );

  static SvgIcon lastFourDigits(Size size) => SvgIcon(
      path: 'assets/images/card/icons/last-four-digits.svg',
      color: SvgIconColor.theme,
      size: size);

  static SvgIcon loadToCard() => const SvgIcon(
        path: 'assets/images/card/icons/load-to-card.svg',
        color: SvgIconColor.theme,
      );

  static SvgIcon viewPin() => const SvgIcon(
        path: 'assets/images/card/icons/view-pin.svg',
        color: SvgIconColor.theme,
      );

  static SvgIcon backOfCard(Size size) => SvgIcon(
        path: 'assets/images/card/icons/back-of-card.svg',
        color: SvgIconColor.theme,
        size: size,
      );

  static SvgIcon blockCard(Size size) => SvgIcon(
    path: 'assets/images/card/icons/block-card.svg',
    color: SvgIconColor.noColor,
    size: size,
  );

  static SvgIcon unblockCard(Size size) => SvgIcon(
    path: 'assets/images/card/icons/unblock-card.svg',
    color: SvgIconColor.noColor,
    size: size,
  );

  static SvgIcon getStatement(Size size) => SvgIcon(
      path: 'assets/images/card/icons/get-statement.svg',
      color: SvgIconColor.noColor,
      size: size,
  );

  static SvgIcon seePin(Size size) => SvgIcon(
      path: 'assets/images/card/icons/see-pin.svg',
      color: SvgIconColor.noColor,
      size: size,
  );

  static const SvgIcon changecoin =
      SvgIcon(path: 'assets/icons/changecoin.svg');

  static const SvgIcon changeicon = SvgIcon(
      path: 'assets/icons/Change.svg',
      color: SvgIconColor.noColor
  );

  static SvgIcon phoneActions(Size size) => SvgIcon(
        path: 'assets/images/shared/phone-actions.svg',
        color: SvgIconColor.noColor,
        size: size,
      );

  static SvgIcon unicorn(Size size) => SvgIcon(
        path: 'assets/images/shared/unicorn.svg',
        color: SvgIconColor.noColor,
        size: size,
      );

  static SvgIcon boomerang(Size size) => SvgIcon(
    path: 'assets/images/shared/boomerang.svg',
    color: SvgIconColor.noColor,
    size: size,
  );

  static const SvgIcon colourfulBundle = SvgIcon(
    path: 'assets/icons/american_tech_stocks.svg',
    color: SvgIconColor.noColor,
  );

  static const SvgIcon colourfulApple = SvgIcon(
    path: 'assets/icons/apple.svg',
    color: SvgIconColor.noColor,
  );

  static const SvgIcon colourfulCryptoCurrencyIndex = SvgIcon(
    path: 'assets/icons/cryptocurrency_index.svg',
    color: SvgIconColor.noColor,
  );

  static const SvgIcon colourfulDigix = SvgIcon(
    path: 'assets/icons/digix.svg',
    color: SvgIconColor.noColor,
  );

  static SvgIcon potOfGold(Size size) => SvgIcon(
    path: 'assets/images/market/pot-of-gold.svg',
    color: SvgIconColor.noColor,
    size: size,
  );

  static SvgIcon cog(Size size) => SvgIcon(
    path: 'assets/icons/cog.svg',
    color: SvgIconColor.noColor,
    size: size,
  );

  static const SvgIcon information = SvgIcon(
    path: 'assets/icons/information.svg',
    color: SvgIconColor.noColor,
  );

  static SvgIcon filter(Size size) => SvgIcon(
    path: 'assets/icons/filter.svg',
    color: SvgIconColor.noColor,
    size: size
  );

  static const SvgIcon transactionAtm = SvgIcon(
      path: 'assets/images/transaction/atm.svg',
      color: SvgIconColor.noColor
  );
  static const SvgIcon transactionBuy = SvgIcon(
      path: 'assets/images/transaction/buy.svg',
      color: SvgIconColor.noColor
  );
  static const SvgIcon transactionCardPayment = SvgIcon(
      path: 'assets/images/transaction/card.svg',
      color: SvgIconColor.noColor
  );
  static const SvgIcon transactionConvert = SvgIcon(
      path: 'assets/images/transaction/convert.svg',
      color: SvgIconColor.noColor
  );
  static const SvgIcon transactionFees = SvgIcon(
      path: 'assets/images/transaction/fees.svg',
      color: SvgIconColor.noColor
  );
  static const SvgIcon transactionReceived = SvgIcon(
      path: 'assets/images/transaction/received.svg',
      color: SvgIconColor.noColor
  );
  static const SvgIcon transactionSell = SvgIcon(
      path: 'assets/images/transaction/sell.svg',
      color: SvgIconColor.noColor
  );
  static const SvgIcon transactionSendOut = SvgIcon(
      path: 'assets/images/transaction/sendout.svg',
      color: SvgIconColor.noColor
  );

  static const SvgIcon transactionAtmError = SvgIcon(
      path: 'assets/images/transaction/atm_error.svg',
      color: SvgIconColor.noColor
  );
  static const SvgIcon transactionBuyError = SvgIcon(
      path: 'assets/images/transaction/buy_error.svg',
      color: SvgIconColor.noColor
  );
  static const SvgIcon transactionCardPaymentError = SvgIcon(
      path: 'assets/images/transaction/card_error.svg',
      color: SvgIconColor.noColor
  );
  static const SvgIcon transactionConvertError = SvgIcon(
      path: 'assets/images/transaction/convert_error.svg',
      color: SvgIconColor.noColor
  );
  static const SvgIcon transactionFeesError = SvgIcon(
      path: 'assets/images/transaction/fees_error.svg',
      color: SvgIconColor.noColor
  );

  static const SvgIcon transactionReceivedError = SvgIcon(
      path: 'assets/images/transaction/received_error.svg',
      color: SvgIconColor.noColor
  );
  static const SvgIcon transactionSellError = SvgIcon(
      path: 'assets/images/transaction/sell_error.svg',
      color: SvgIconColor.noColor
  );
  static const SvgIcon transactionSendOutError = SvgIcon(
      path: 'assets/images/transaction/sendout_error.svg',
      color: SvgIconColor.noColor
  );

  static SvgIcon changeLogoGreen(Size size) =>
      SvgIcon(
        path: 'assets/logo/change-logo-green.svg',
        color: SvgIconColor.noColor,
        size: size,
      );

  static SvgIcon notificationGreen(Size size) =>
      SvgIcon(
        path: 'assets/icons/notification.svg',
        color: SvgIconColor.noColor,
        size: size,
      );

  static const SvgIcon cardVisa = const SvgIcon(
      path: 'assets/images/card/card-visa.svg',
      color: SvgIconColor.noColor,
      size: Size.square(80.0)
  );

  static const SvgIcon eurWalletIllustration = const SvgIcon(
    path: 'assets/images/market/euro-wallet.svg',
    color: SvgIconColor.noColor,
    size: Size(167.0, 81.0)
  );

  static const SvgIcon cardSmall = const SvgIcon(
    path: 'assets/images/card/icons/card-small.svg',
    color: SvgIconColor.noColor,
    size: Size.square(24.0),
  );

  static const SvgIcon makeFirstDepositImage = const SvgIcon(
    path: 'assets/images/home/make-a-deposit-portfolio.svg',
    color: SvgIconColor.noColor,
  );

  static const SvgIcon startVerificationImage = const SvgIcon(
    path: 'assets/images/home/verification.svg',
    color: SvgIconColor.noColor,
  );

  static const SvgIcon rejectedVerificationImage = const SvgIcon(
    path: 'assets/images/home/verification-rejected.svg',
    color: SvgIconColor.noColor,
  );

  static SvgIcon noInternetConnection(Size size) => SvgIcon(
    path: 'assets/images/no_internet/no-internet-connection.svg',
    color: SvgIconColor.noColor,
    size: size,
  );


  static SvgIcon infoSmall(Size size) => SvgIcon(
    path: 'assets/icons/information.svg',
    color: SvgIconColor.noColor,
    size: size,
  );

  static SvgIcon share(Size size) => SvgIcon(
    path: 'assets/icons/share.svg',
    color: SvgIconColor.noColor,
    size: size,
  );

  static SvgIcon priceTag(Size size) =>
      SvgIcon(path: 'assets/icons/price_tag.svg',
        color: SvgIconColor.noColor,
        size: size);

  static SvgIcon gift(Size size) =>
      SvgIcon(path: 'assets/icons/gift.svg',
          color: SvgIconColor.noColor,
          size: size);

  static const SvgIcon actionButtonConvert = SvgIcon(
      path: 'assets/images/action-buttons/convert.svg',
      color: SvgIconColor.noColor,
      size: Size(38.0, 38.0)
  );

  static const SvgIcon actionButtonBuy = SvgIcon(
      path: 'assets/images/action-buttons/buy.svg',
      color: SvgIconColor.noColor,
      size: Size(38.0, 38.0)
  );

  static const SvgIcon actionButtonDeposit = SvgIcon(
      path: 'assets/images/action-buttons/deposit.svg',
      color: SvgIconColor.noColor,
      size: Size(38.0, 38.0)
  );

  static const SvgIcon actionButtonSell = SvgIcon(
      path: 'assets/images/action-buttons/sell.svg',
      color: SvgIconColor.noColor,
      size: Size(38.0, 38.0)
  );

  static const SvgIcon actionButtonWithdraw = SvgIcon(
      path: 'assets/images/action-buttons/withdraw.svg',
      color: SvgIconColor.noColor,
      size: Size(38.0, 38.0)
  );

  static const SvgIcon actionButton = SvgIcon(
      path: 'assets/images/action-buttons/action_button.svg',
      color: SvgIconColor.noColor,
      size: Size(24.0, 24.0)
  );
}
