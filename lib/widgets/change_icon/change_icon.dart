import 'dart:convert' show utf8;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:resource/resource.dart' show Resource;

import 'change_icon_data.dart';


class ChangeIcon extends StatefulWidget {

  final ChangeIconData _iconData;
  final bool isStandAloneMode;

  const ChangeIcon(this._iconData, { this.isStandAloneMode =  false});

  @override
  State<StatefulWidget> createState() {
    return ChangeIconState(_iconData, isStandAloneMode: isStandAloneMode);
  }
}


class ChangeIconState extends State<ChangeIcon> {

  ChangeIconData _iconData;
  String _svgContents;
  final bool isStandAloneMode;

  ChangeIconState(this._iconData, { this.isStandAloneMode =  false});

  @override
  void initState() {
    super.initState();

    if (isStandAloneMode)
      rootBundle.loadString('lib/${_iconData.getIconPath()}').then((svgValue) {
        setState(() {
          _svgContents = svgValue;
        });
      });
    else {
      final resource = Resource('package:flutter_ui_kit/${_iconData.getIconPath()}');
      resource.readAsString(encoding: utf8).then((contents) {
        setState(() {
          _svgContents = contents;
        });
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    if (_svgContents == null)
      return Container();

    return SvgPicture.string(_svgContents);
  }
}