import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:package_info/package_info.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'change_icon_data.dart';


class ChangeIcon extends StatefulWidget {

  final ChangeIconData iconData;

  const ChangeIcon(this.iconData);

  @override
  State<StatefulWidget> createState() {
    return _ChangeIconState();
  }
}

class _ChangeIconState extends State<ChangeIcon> {

  String _svgContents;

  @override
  void initState() {
    super.initState();

    PackageInfo.fromPlatform().then((packageInfo) {
      print(packageInfo.packageName);
      var iconPath = '';
      if (
          packageInfo.packageName == 'com.example.changeUiKit' || packageInfo.packageName == 'com.getchange.flutter_ui_kit'
      )
        iconPath = 'lib/assets/icons/${widget.iconData.getIconPath()}';
      else
        iconPath = 'packages/flutter_ui_kit/assets/icons/${widget.iconData.getIconPath()}';

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

    return SvgPicture.string(_svgContents, width: 32.0, height: 32.0);
  }
}