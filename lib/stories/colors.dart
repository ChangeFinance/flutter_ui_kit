import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/story_book/story.dart';
import 'package:flutter/material.dart';

class AppColors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _primaryColors(),
            _accentColors(),
            _semanticColors(),
            _greyColors(),
          ],
        ),
      ),
    );
  }

  Widget _primaryColors() {
    return Story(
      title: 'Primary Colors',
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ColorInfoBox(
            color: AppColor.green,
            name: 'Green',
            usage: 'Button & Text Button',
          ),
          ColorInfoBox(
            color: AppColor.paleGreen,
            name: 'Pale Green 20%',
            usage: 'Disabled Text Button',
          ),
          const ColorInfoBox(
            color: AppColor.darkerGreen,
            name: 'Darker Green',
            usage: 'Pressed button state',
          ),
        ],
      ),
    );
  }

  Widget _accentColors() {
    return Story(
      title: 'Accent Colors',
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          ColorInfoBox(
            color: AppColor.deepBlack,
            name: 'Deep Black',
            usage: 'Heading, Important Text & Icons',
          ),
          ColorInfoBox(
            color: AppColor.deepWhite,
            name: 'deepWhite',
            usage: 'Background',
          ),
        ],
      ),
    );
  }

  Widget _semanticColors() {
    return Story(
      title: 'Semantic Colors',
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          ColorInfoBox(
            color: AppColor.red,
            name: 'Red',
            usage: 'Error Text',
          ),
          ColorInfoBox(
            color: AppColor.brightGreen,
            name: 'Green success',
            usage: 'Success',
          ),
        ],
      ),
    );
  }

  Widget _greyColors() {
    return Story(
      title: 'Grey Colors',
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ColorInfoBox(
              color: AppColor.lightestGrey,
              name: 'Lightest grey',
              usage: 'Dividers & Failed Transactions',
            ),
            ColorInfoBox(
              color: AppColor.grey,
              name: 'Grey',
              usage: 'Placeholder',
            ),
            ColorInfoBox(
              color: AppColor.mediumGrey,
              name: 'Medium Grey',
              usage: 'Disables buttons',
            ),
            ColorInfoBox(
              color: AppColor.semiGrey,
              name: 'Semi Grey',
              usage: 'Text & Icons',
            ),
          ],
        ),
      ),
    );
  }
}

class ColorInfoBox extends StatelessWidget {
  final Color? color;
  final String? name;
  final String? usage;

  const ColorInfoBox({this.color, this.name, this.usage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: <Widget>[
          Container(
            width: 100.0,
            height: 100.0,
            color: color,
          ),
          Container(
            width: 100.0,
            child: Text(name!),
          ),
          Container(
            width: 100.0,
            child: Text('Usage: $usage'),
          ),
        ],
      ),
    );
  }
}
