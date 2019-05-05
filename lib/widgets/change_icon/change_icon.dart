import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'change_icon_data.dart';


class ChangeIcon extends StatefulWidget {

  final ChangeIconData _iconData;

  const ChangeIcon(this._iconData);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChangeIconState(_iconData);
  }
}


class ChangeIconState extends State<ChangeIcon> {

  ChangeIconData _iconData;
  String _svgContents;

  ChangeIconState(this._iconData);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rootBundle.loadString(_iconData.getIconPath()).then((svgValue) {
      setState(() {
        _svgContents = svgValue;
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