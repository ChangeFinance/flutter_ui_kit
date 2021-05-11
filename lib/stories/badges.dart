import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/story_book/expandable_story.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/bool_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/double_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/dropdown_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/string_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/props_explorer.dart';
import 'package:flutter_ui_kit/widgets/badge/badge.dart';
import 'package:flutter_ui_kit/widgets/badge/category_badge.dart';
import 'package:flutter_ui_kit/widgets/badge/category_badge_list.dart';
import 'package:flutter_ui_kit/widgets/badge/multivalue_badge.dart';
import 'package:flutter_ui_kit/widgets/badge/odometer_badge.dart';

import '../color.dart';

const _colorList = ['Red', 'Green'];

Color _optionToColor(String optionSelected) {
  switch (optionSelected) {
    case 'Red':
      return AppColor.red;
    default:
      return AppColor.green;
  }
}

class Badges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(child: _badgesStory()),
    );
  }
}

Widget _badgesStory() {
  return Container(
      child: SingleChildScrollView(
          child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      _simpleBadgeStory(),
      _multiValueBadgeStory(),
      _OdometerBadgeStory(),
      _categoryBadgeStory(),
      _categoryBageListStory()
    ],
  )));
}

Widget _simpleBadgeStory() {
  return ExpandableStory(
      title: 'Simple Badge',
      child: PropsExplorer(
          initialProps: const <String, dynamic>{'text': '\$1234.56', 'minWidth': 80.0, 'bgColor': 'Green'},
          formBuilder: (context, props, updateProp) {
            return ListView(physics: const NeverScrollableScrollPhysics(), shrinkWrap: true, children: <Widget>[
              StringPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'text',
              ),
              DoublePropUpdater(props: props, updateProp: updateProp, propKey: 'minWidth', min: 60.0, max: 160.0),
              DropdownPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'bgColor',
                options: _colorList,
              )
            ]);
          },
          widgetBuilder: (context, props) {
            return Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                  child: Center(
                      child: Badge(
                props['text'],
                minWidth: props['minWidth'],
                bgColor: _optionToColor(props['bgColor']),
              ))),
            ]);
          }));
}

Widget _multiValueBadgeStory() {
  return ExpandableStory(
      title: 'MultiValue Badge',
      child: PropsExplorer(
          initialProps: const <String, dynamic>{
            'texts': ['\$1234.56', '+1.23%'],
            'minWidth': 120.0,
            'bgColor': 'Green'
          },
          formBuilder: (context, props, updateProp) {
            return ListView(physics: const NeverScrollableScrollPhysics(), shrinkWrap: true, children: <Widget>[
              DoublePropUpdater(props: props, updateProp: updateProp, propKey: 'minWidth', min: 60.0, max: 160.0),
              DropdownPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'bgColor',
                options: _colorList,
              )
            ]);
          },
          widgetBuilder: (context, props) {
            return Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                  child: MultiValueBadge(
                props['texts'],
                minWidth: props['minWidth'],
                bgColor: _optionToColor(props['bgColor']),
              )),
            ]);
          }));
}

// ignore: must_be_immutable
class _OdometerBadgeStory extends StatelessWidget {
  double _initial = 0.00;
  double _current = 0.00;

  @override
  Widget build(BuildContext context) {
    const textStyle = const TextStyle(color: AppColor.deepWhite, fontSize: 15);
    return ExpandableStory(
      title: 'Odometer Badge',
      child: PropsExplorer(
        initialProps: const <String, dynamic>{'bgColor': 'Green'},
        formBuilder: (context, props, updateProp) {
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              DropdownPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'bgColor',
                options: _colorList,
              )
            ],
          );
        },
        widgetBuilder: (_, props) {
          return StatefulBuilder(builder: (ctx, stateSetter) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 10),
                OdometerBadge(
                  _getTextRuns(_initial, _current),
                  bgColor: _optionToColor(props['bgColor']),
                  baseColor: AppColor.deepWhite,
                  textStyle: textStyle,
                ),
                const SizedBox(height: 10),
                RaisedButton(
                  child: const Text('update', style: const TextStyle(color: Colors.white)),
                  onPressed: () {
                    stateSetter(() {
                      _initial = _current;
                      _current = _initial == 0 ? 0.5 : _initial * 1.2;
                    });
                  },
                )
              ],
            );
          });
        },
      ),
    );
  }

  List<UnstyledTextRun> _getTextRuns(double val, double newVal) {
    final parts = '€${val.toStringAsFixed(2)}'.split('.');
    if (parts.length == 2) {
      parts.insert(1, '.');
    }

    final newParts = '€${newVal.toStringAsFixed(2)}'.split('.');
    if (newParts.length == 2) {
      newParts.insert(1, '.');
    }
    final runs = <UnstyledTextRun>[
      UnstyledTextRun(newParts[0], parts[0]),
    ];

    if (parts.length > 1) {
      runs.add(UnstyledTextRun(newParts[1], parts[1]));
    }

    if (parts.length > 2) {
      runs.add(UnstyledTextRun(newParts[2], parts[2]));
    }
    return runs;
  }
}


Widget _categoryBadgeStory() {
  return ExpandableStory(
      title: 'Category Badge',
      child: PropsExplorer(
          initialProps: const <String, dynamic>{'text': 'US Stocks CFDs', 'tagText': '22', 'selected': true},
          formBuilder: (context, props, updateProp) {
            return ListView(physics: const NeverScrollableScrollPhysics(), shrinkWrap: true, children: <Widget>[
              StringPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'text',
              ),
              StringPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'tagText',
              ),
              BoolPropUpdater(props: props, updateProp: updateProp, propKey: 'selected'),
            ]);
          },
          widgetBuilder: (context, props) {
            final bool isSelected = props['selected'];
            return Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                  child: Center(
                      child: CategoryBadge(
                          text: props['text'],
                          tagText: props['tagText'],
                          selected: isSelected
                      ))),
            ]);
          }));
}

Widget _categoryBageListStory() {
  return ExpandableStory(
    title: 'Category Badge List',
    child: CategoryBadgeList(
      models: [
        CategoryBadge(
          text: 'Cryptocurrencies',
          tagText: '22',
          name: 'CRYPTO',
        ),
        CategoryBadge(
          text: 'Cryptocurrencies CFDs',
          tagText: '1',
          name: 'CRYPTO_CFD',
        ),
        CategoryBadge(
          text: 'Commodities CFDs',
          tagText: '1',
          name: 'COMMODITY_CFD',
        ),
        CategoryBadge(
          text: 'US Stock CFDs',
          tagText: '1',
          name: 'US_STOCK_CFD',
        ),
        CategoryBadge(
          text: 'Indexes CFDs',
          tagText: '1',
          name: 'INDEX_CFD',
        ),
        CategoryBadge(
          text: 'Startups',
          tagText: '1',
          name: 'STARTUPS',
        ),
      ],
      onChange: (CategoryBadge selected) {
        print (selected?.name);
      },
    ),
  );
}
