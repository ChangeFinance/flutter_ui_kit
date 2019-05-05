import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'change_icon_data.dart';

class ChangeIcon extends StatelessWidget {

  final ChangeIconData _iconData;

  const ChangeIcon(this._iconData);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(_iconData.getIconPath());
  }
}