import 'package:flutter_svg/flutter_svg.dart';

class RadioModel {
  bool? isSelected;
  bool isEnabled;
  final String text;
  SvgPicture? svgPicture;
  final String? textShortform;

  RadioModel(
    this.text, {
    this.svgPicture,
    this.isSelected,
    this.textShortform,
    this.isEnabled = true,
  });
}
