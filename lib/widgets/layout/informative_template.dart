import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/text.dart';
import 'package:flutter_ui_kit/widgets/layout/page_template.dart';
import 'package:flutter_ui_kit/widgets/text/heading.dart';
import 'package:flutter_ui_kit/widgets/text/heading_type.dart';

import 'app_bar.dart';

class InformativeTemplate extends StatelessWidget {
  final Widget leadingWidget;
  final List<Widget> tailingWidget;
  final SvgPicture picture;
  final String heading;
  final String body;
  final Widget action;

  const InformativeTemplate(this.heading, this.body, this.picture, this.action,{this.leadingWidget, this.tailingWidget})
      : super();

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      appBar: MainAppBar(
        implyLeading: leadingWidget != null, leadingWidget: leadingWidget, tailingWidget: tailingWidget,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top:15.0, bottom: 15),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Heading(
                      heading,
                      headingType: HeadingType.HEADING_1,
                      textAlign: TextAlign.left,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(body,
                          textAlign: TextAlign.left,
                          style:
                              AppText.body1.copyWith(color: AppColor.semiGrey)),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 120.0),
                      child: picture,
                    ))),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: action,
            ),
          ],
        ),
      ),
    );
  }
}
