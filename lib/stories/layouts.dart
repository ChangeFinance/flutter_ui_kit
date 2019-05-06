import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_kit/widgets/filled_button.dart';
import 'package:flutter_ui_kit/widgets/layout/utility_template.dart';

class Layouts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _utilityLayout(context),
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

  static const String utilityLayoutRoute = '/utility-layout-page';
}
