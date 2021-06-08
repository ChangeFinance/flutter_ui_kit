import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_kit/widgets/text/heading.dart';
import 'package:flutter_ui_kit/widgets/text/heading_type.dart';
import 'package:flutter_ui_kit/widgets/wizzard/template/wizard_utility_page.dart';
import 'package:flutter_ui_kit/widgets/wizzard/wizard.dart';
import 'package:flutter_ui_kit/widgets/wizzard/wizard_binder.dart';

class WizardStory extends StatelessWidget {
  final WizardBinder binder = WizardBinder();

  @override
  Widget build(BuildContext context) {
    return Wizard(
      intoWidget: _wizardIntro(),
      wizardPages: [_wizardPageOne(), _wizardPageTwo(), _wizardPageThree()],
      outroWidget: _wizardOutro(),
      binder: binder,
    );
  }

  Widget _wizardIntro() {
    return WizardUtilityPage(
        'Welcome to Wizard',
        'Before you get start with wizard please read this description '
            'because of reasons, may the force be with you.',
        SvgPicture.asset(
          'assets/update-app.svg',
          width: 285.0,
          height: 215.0,
        ));
  }

  Widget _wizardOutro() {
    return WizardUtilityPage(
        'You\'re all set!!',
        'Have fun with the wizard and may the you not slip into the dark side.',
        SvgPicture.asset(
          'assets/update-app.svg',
          width: 285.0,
          height: 215.0,
        ));
  }

  Widget _wizardPageOne() {
    return Column(
      children: <Widget>[
        const Align(
            alignment: Alignment.centerLeft,
            child: ChgHeading('Mandatory page',
                headingType: HeadingType.HEADING_1, textAlign: TextAlign.left)),
        Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'First name',
                labelStyle:
                    TextStyle(fontSize: 18, color: Colors.black, height: -1.0),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
              autofocus: true,
              onSaved: (String? value) {},
            )),
      ],
    );
  }

  Widget _wizardPageTwo() {
    return Column(
      children: <Widget>[
        const Align(
            alignment: Alignment.centerLeft,
            child: ChgHeading('Do this later',
                headingType: HeadingType.HEADING_1, textAlign: TextAlign.left)),
        Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Last name',
                labelStyle:
                    TextStyle(fontSize: 18, color: Colors.black, height: -1.0),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
              autofocus: true,
              onSaved: (String? value) {},
            )),
      ],
    );
  }

  Widget _wizardPageThree() {
    return Column(
      children: <Widget>[
        const Align(
            alignment: Alignment.centerLeft,
            child: ChgHeading('Skippable page',
                headingType: HeadingType.HEADING_1, textAlign: TextAlign.left)),
        Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Last name',
                labelStyle:
                    TextStyle(fontSize: 18, color: Colors.black, height: -1.0),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
              autofocus: true,
              onSaved: (String? value) {},
            )),
      ],
    );
  }
}
