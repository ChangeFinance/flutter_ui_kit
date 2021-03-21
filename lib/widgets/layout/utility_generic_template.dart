import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_kit/ui/page_template.dart';
import 'package:flutter_ui_kit/widgets/text/heading.dart';
import 'package:flutter_ui_kit/widgets/text/heading_type.dart';

import 'app_bar.dart';

class UtilityGenericTemplate extends StatelessWidget {
  final SvgPicture picture;
  final String heading;
  final Widget body;
  final Widget action;
  final bool shouldRestrictWidth;
  final bool shouldImplyLeading;

  UtilityGenericTemplate(this.heading, this.body, this.picture, this.action,
      {this.shouldRestrictWidth = true, this.shouldImplyLeading = false})
      : super();

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      appBar: MainAppBar(implyLeading: shouldImplyLeading),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 34.0),
                  child: picture,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                constraints: shouldRestrictWidth
                    ? BoxConstraints(maxWidth: picture.width)
                    : const BoxConstraints(),
                child: Column(
                  children: <Widget>[
                    ChgHeading(
                      heading,
                      headingType: HeadingType.HEADING_1,
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: body,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: action,
            )
          ],
        ),
      ),
    );
  }
}
