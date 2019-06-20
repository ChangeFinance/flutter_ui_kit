import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/text.dart';
import 'package:flutter_ui_kit/widgets/layout/page_template.dart';
import 'package:flutter_ui_kit/widgets/text/heading.dart';
import 'package:flutter_ui_kit/widgets/text/heading_type.dart';

class UtilitySlide extends StatelessWidget {
  final SvgPicture picture;
  final String heading;
  final String body;

  const UtilitySlide(this.heading, this.body, this.picture)
      : super();

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
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
                child: Column(
                  children: <Widget>[
                    Heading(
                      heading,
                      headingType: HeadingType.HEADING_1,
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(body,
                          textAlign: TextAlign.center,
                          style:
                              AppText.body1.copyWith(color: AppColor.semiGrey)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
