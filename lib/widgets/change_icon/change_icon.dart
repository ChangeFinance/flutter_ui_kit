import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:package_info/package_info.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'change_icon_data.dart';


class ChangeIcon extends StatefulWidget {

  final ChangeIconData _iconData;

  const ChangeIcon(this._iconData);

  @override
  State<StatefulWidget> createState() {
    return ChangeIconState(_iconData);
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

    PackageInfo.fromPlatform().then((packageInfo) {
      print(packageInfo.packageName);
      var iconPath = '';
      if (packageInfo.packageName == 'com.example.changeUiKit')
        iconPath = 'lib/assets/icons/${_iconData.getIconPath()}';
      else
        iconPath = 'packages/flutter_ui_kit/assets/icons/${_iconData.getIconPath()}';

      rootBundle.loadString(iconPath).then((svgValue) {
        setState(() {
          _svgContents = svgValue;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_svgContents == null)
      return Container();

    return SvgPicture.string(_svgContents);
  }
}