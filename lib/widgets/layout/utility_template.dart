import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/text.dart';
import 'package:flutter_ui_kit/widgets/layout/utility_generic_template.dart';


class UtilityTemplate extends UtilityGenericTemplate {

  UtilityTemplate(String heading, String bodyAsText, SvgPicture picture, Widget? action,
      {bool restrictWidth = true, bool implyLeading = false})
      : super(
              heading,
              Text(bodyAsText,
                  textAlign: TextAlign.center,
                  style: AppText.body1.copyWith(color: AppColor.semiGrey)),
              picture,
              action,
              shouldRestrictWidth: restrictWidth,
              shouldImplyLeading: implyLeading);
}
