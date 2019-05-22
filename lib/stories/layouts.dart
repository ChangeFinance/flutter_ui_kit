import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_kit/widgets/filled_button.dart';
import 'package:flutter_ui_kit/widgets/layout/generic_template.dart';
import 'package:flutter_ui_kit/widgets/layout/utility_template.dart';
import 'package:flutter_ui_kit/widgets/text/heading.dart';
import 'package:flutter_ui_kit/widgets/text/heading_type.dart';

class Layouts extends StatelessWidget {
  static const String utilityLayoutRoute = '/utility-layout-page';
  static const String dismissibleLayoutRoute = '/dismissible-layout-page';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _utilityLayout(context),
            _dismissibleLayout(context),
          ],
        ),
      ),
    );
  }

  Widget _utilityLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: FilledButton(
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
                        FilledButton(
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

  Widget _dismissibleLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: FilledButton(
          'I\'m all about that close button',
          onPressed: () {
            Navigator.push<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                    settings: const RouteSettings(name: dismissibleLayoutRoute),
                    builder: (_) => GenericTemplate(
                        const Heading('How can we make Change better?', headingType: HeadingType.HEADING_1, textAlign: TextAlign.left),
                        Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Give us your feedback',
                                labelStyle: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    height: -1.0),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                              ),
                              autofocus: true,
                              onSaved: (String value) {},
                            )),
                        FilledButton('SEND', fullWidth: true, onPressed: (){ print('you clicked send'); }),
                        dismissible: true)));
          },
          fullWidth: false,
          narrow: false,
        ),
      ),
    );
  }
}