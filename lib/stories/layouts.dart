import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_kit/widgets.dart';
import 'package:flutter_ui_kit/widgets/customradio/custom_radio.dart';
import 'package:flutter_ui_kit/widgets/filled_button.dart';
import 'package:flutter_ui_kit/widgets/layout/generic_template.dart';
import 'package:flutter_ui_kit/widgets/layout/information_template.dart';
import 'package:flutter_ui_kit/widgets/layout/swipe_up_to_confirm.dart';
import 'package:flutter_ui_kit/widgets/layout/titled_generic_template.dart';
import 'package:flutter_ui_kit/widgets/layout/utility_generic_template.dart';
import 'package:flutter_ui_kit/widgets/layout/utility_template.dart';
import 'package:flutter_ui_kit/widgets/text/heading.dart';
import 'package:flutter_ui_kit/widgets/text/heading_type.dart';
import 'package:flutter_ui_kit/widgets/text/label_value_pair.dart';
import 'package:flutter_ui_kit/widgets/text_button.dart';

import '../color.dart';
import '../text.dart';

class Layouts extends StatelessWidget {
  static const String informationLayoutRoute = '/information-layout-page';
  static const String utilityLayoutRoute = '/utility-layout-page';
  static const String utilityGenericLayoutRoute = 'utility-generic-layout-page';
  static const String dismissibleLayoutRoute = '/dismissible-layout-page';
  static const String infoLayoutRoute = '/info-layout-page';
  static const String paymentMethodLayout = '/payment-method';
  static const String buySellLayout = '/buy-sell';
  static const String cameraLayoutRoute = '/camera-screen';
  static const String swipeUpToConfirmLayoutRoute = '/swipe-up-to-confirm';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _informationLayout(context),
            _utilityLayout(context),
            _utilityGenericLayout(context),
            _dismissibleLayout(context),
            _infoLayout(context),
            _paymentMethod(context),
            _landingPage(context),
            _swipeUpToConfirm(context),
          ],
        ),
      ),
    );
  }

  Widget _utilityLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: ChgFilledButton(
          'I\'m all about that utility',
          onPressed: () {
            Navigator.push<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                    settings: const RouteSettings(name: utilityLayoutRoute),
                    builder: (_) => UtilityTemplate(
                        'Update your app',
                        'Get the latest version of Change to make sure you have access to the latest features and updates.',
                        SvgPicture.asset(
                          'assets/update-app.svg',
                          width: 285.0,
                          height: 215.0,
                        ),
                        ChgFilledButton(
                          'Update app',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          fullWidth: true,
                          narrow: false,
                        ))));
          },
          fullWidth: false,
          narrow: false,
        ),
      ),
    );
  }

  Widget _utilityGenericLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: ChgFilledButton(
          'I\'m all about that generic utility',
          onPressed: () {
            Navigator.push<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                    settings: const RouteSettings(name: utilityGenericLayoutRoute),
                    builder: (_) => UtilityGenericTemplate(
                        'Update your app',
                        Column(
                          children: <Widget>[
                            Text('Get the latest version of Change.',
                                textAlign: TextAlign.center,
                                style: AppText.body1.copyWith(color: AppColor.semiGrey)),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: 'If you have any questions, please contact ',
                                style: AppText.body1
                                    .copyWith(color: AppColor.semiGrey),
                                children: [
                                  new TextSpan(
                                      text: 'support@getchange.com',
                                      style:
                                      const TextStyle(color: AppColor.green),
                                      recognizer: new TapGestureRecognizer()
                                        ..onTap = () {}),],),
                            )
                          ],
                        ),
                        SvgPicture.asset(
                          'assets/update-app.svg',
                          width: 285.0,
                          height: 215.0,
                        ),
                        ChgFilledButton(
                          'Update app',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          fullWidth: true,
                          narrow: false,
                        ))));
          },
          fullWidth: false,
          narrow: false,
        ),
      ),
    );
  }

  Widget _informationLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: ChgFilledButton(
          'I\'m all about that txt txt pic',
          onPressed: () {
            Navigator.push<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                    settings: const RouteSettings(name: informationLayoutRoute),
                    builder: (_) => InformationTemplate(
                          'Information template',
                          'To verify your account, we need you to submit another identity document, alongside with your residence permit.\n\nYou can submit a photo of your passport, national ID, or drivers’ license.',
                          SvgPicture.asset(
                            'assets/update-app.svg',
                            width: 200.0,
                            height: 200.0,
                          ),
                          ChgFilledButton(
                            'Back',
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            fullWidth: true,
                            narrow: false,
                          ),
                          leadingWidget: const BackButton(),
                        )));
          },
          fullWidth: false,
          narrow: false,
        ),
      ),
    );
  }

  Widget _dismissibleLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: ChgFilledButton(
          'I\'m all about that close button',
          onPressed: () {
            Navigator.push<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                    settings: const RouteSettings(name: dismissibleLayoutRoute),
                    builder: (_) => GenericTemplate(
                        const ChgHeading('How can we make Change better?',
                            headingType: HeadingType.HEADING_1, textAlign: TextAlign.left),
                        Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Give us your feedback',
                                labelStyle: TextStyle(fontSize: 18, color: Colors.black, height: -1.0),
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                              ),
                              autofocus: true,
                              onSaved: (String value) {},
                            )),
                        ChgFilledButton('SEND', fullWidth: true, onPressed: () {
                          print('you clicked send');
                        }),
                        leadingWidget: const CloseButton())));
          },
          fullWidth: false,
          narrow: false,
        ),
      ),
    );
  }

  Widget _infoLayout(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
            child: ChgFilledButton('I\'m all about that info button', onPressed: () {
          Navigator.push<dynamic>(
              context,
              MaterialPageRoute<dynamic>(
                settings: const RouteSettings(name: infoLayoutRoute),
                builder: (_) => GenericTemplate(
                    const ChgHeading('Invite a friend and you both get €10 worth of Bitcoin',
                        headingType: HeadingType.HEADING_2, textAlign: TextAlign.left),
                    Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Column(children: <Widget>[
                          const ChgLabelValuePair(
                              labelText: 'Invite Link',
                              valueText: 'getchange.com/r/2415',
                              copyToClipboardEnabled: true),
                          Expanded(
                            flex: 1,
                            child: SvgPicture.asset(
                              'assets/referral-screen.svg',
                              width: 285.0,
                              height: 215.0,
                            ),
                          ),
                        ])),
                    ChgFilledButton('Invite friends', fullWidth: true, onPressed: () {
                      print('you clicked invite friends');
                    }),
                    tailingWidget: [
                      IconButton(
                          icon: const Icon(Icons.info_outline),
                          onPressed: () {
                            Navigator.pop(context);
                          })
                    ]),
              ));
        })));
  }

  Widget _paymentMethod(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
            child: ChgFilledButton('I\'m all about that payment methods', onPressed: () {
          Navigator.push<dynamic>(
              context,
              MaterialPageRoute<dynamic>(
                settings: const RouteSettings(name: infoLayoutRoute),
                builder: (_) => GenericTemplate(
                    const ChgHeading('Deposit', headingType: HeadingType.HEADING_2, textAlign: TextAlign.left),
                    Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(bottom: 60.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Add Euro or cryptocurrency to your Change account.',
                                    textAlign: TextAlign.left,
                                    style: Theme.of(context).textTheme.bodyText1.copyWith(color: AppColor.semiGrey)),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              child: Text('I want to deposit:',
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.bodyText1.copyWith(color: AppColor.semiGrey))),
                          Expanded(
                              flex: 1,
                              child: CustomRadio(
                                radioElements: CustomRadio.availableRadioModels(),
                              )),
                        ])),
                    const SizedBox.shrink(),
                    leadingWidget: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        })),
              ));
        })));
  }

  Widget _landingPage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: ChgFilledButton(
          'I\'m all about landing page',
          onPressed: () {
            Navigator.push<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                    settings: const RouteSettings(name: dismissibleLayoutRoute),
                    builder: (_) => TitledGenericTemplate(
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              const ChgHeading('Exchange CAG tokens to new equity like CNG tokens',
                                  headingType: HeadingType.HEADING_1, textAlign: TextAlign.left),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 14.0),
                                  child: Text('CNG tokens give you the right to become shareholder of Change',
                                      style: Theme.of(context).textTheme.bodyText2),
                                ),
                              ),
                              const SizedBox(
                                height: 33,
                              ),
                              Row(
                                children: <Widget>[
                                  SvgPicture.asset(
                                    'assets/update-app.svg',
                                    width: 24,
                                    height: 24,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  new RichText(
                                    textAlign: TextAlign.left,
                                    text: new TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'What is token swap?',
                                          style: Theme.of(context).textTheme.bodyText1.copyWith(color: AppColor.semiGrey),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(children: <Widget>[
                            ChgFilledButton(
                              'Go to Swap',
                              onPressed: () {
                                print('Test');
                              },
                              fullWidth: true,
                              narrow: false,
                            ),
                            ChgTextButton(
                              'I\'m not CNG owner',
                              onPressed: () {
                                print('Test');
                              },
                            ),
                          ]),
                          leadingWidget: const CloseButton(),
                          title: const Text(
                            'CAG Token Swap',
                          ),
                          picture: SvgPicture.asset(
                            'assets/update-app.svg',
                            width: 285.0,
                            height: 215.0,
                          ),
                        )));
          },
          fullWidth: false,
          narrow: false,
        ),
      ),
    );
  }

  Widget _swipeUpToConfirm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: ChgFilledButton(
          'Swipe up to confirm layout',
          onPressed: () {
            Navigator.push<dynamic>(
              context,
              MaterialPageRoute<dynamic>(
                settings: const RouteSettings(name: swipeUpToConfirmLayoutRoute),
                builder: (_) => SwipeUpToConfirmLayoutWrapper(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SwipeUpToConfirmLayoutWrapper extends StatefulWidget {
  @override
  _SwipeUpToConfirmLayoutWrapperState createState() => _SwipeUpToConfirmLayoutWrapperState();
}

class _SwipeUpToConfirmLayoutWrapperState extends State<SwipeUpToConfirmLayoutWrapper> {
  SwipeMode swipeMode = SwipeMode.swipe;
  bool doneButtonEnabled = true;

  @override
  Widget build(BuildContext context) {
    return SwipeUpToConfirmLayout(
      swipeMode: swipeMode,
      body: Center(
        child: _swipeUpToConfirmBody(),
      ),
      title: 'Swipe up layout',
      swiperDisplay: Container(
        margin: const EdgeInsets.symmetric(vertical: 30),
        child: const Text(
          'Hello world',
          style: TextStyle(color: Colors.white),
        ),
      ),
      swipeCompleteCallback: () {
        print('SWIPE COMPLETE');
      },
      completeScreenLabelTitle: 'Sell BTC order placed',
      completeScreenLabelText: 'Your sell BTC order has been\nsuccessfuly placed',
      completeScreenLabelIcon: const SizedBox(
        width: 100,
        height: 100,
        child: const Text('ICON', style: const TextStyle(color: Colors.white)),
      ),
      completionPrimaryButtonAction: () {
        Navigator.of(context).pop();
      },
      completionPrimaryButtonText: 'Done',
      completionPrimaryButtonEnabled: doneButtonEnabled,
      completionSecondaryButtonAction: () {
        Navigator.of(context).pop();
      },
      completionSecondaryButtonText: 'View order',
      errorState: false,
    );
  }

  Widget _swipeUpToConfirmBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('Swipe view'),
        const SizedBox(height: 20),
        ChgFilledButton(swipeMode == SwipeMode.static ? 'Enable Swiping' : 'Disable Swiping', onPressed: () {
          setState(() {
            if (swipeMode == SwipeMode.swipe) {
              swipeMode = SwipeMode.static;
            } else {
              swipeMode = SwipeMode.swipe;
            }
          });
        }),
        const SizedBox(height: 20),
        ChgFilledButton(doneButtonEnabled ? 'Disable Done button' : 'Enable Done button', onPressed: () {
          setState(() {
            doneButtonEnabled = !doneButtonEnabled;
          });
        })
      ],
    );
  }
}
