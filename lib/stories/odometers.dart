import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/story_book/expandable_story.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/dropdown_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/props_explorer.dart';
import 'package:flutter_ui_kit/text_styles.dart';
import 'package:flutter_ui_kit/widgets/odometer/odometer.dart';
import 'package:flutter_ui_kit/widgets/odometer/single_digit.dart';
import 'package:flutter_ui_kit/widgets/odometer/text_run.dart';

class Odometers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _SingleDigit(),
            _MultipleDigits(),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class _SingleDigit extends StatelessWidget {
  int initialVal = 0;
  int finalVal = 0;

  @override
  Widget build(BuildContext context) {
    final digits = List<String>.generate(10, (i) => '$i');
    return ExpandableStory(
      title: 'Single Digit',
      child: PropsExplorer(
        initialProps: const <String, dynamic>{
          'start': '0',
          'end': '2',
        },
        formBuilder: (ctx, props, updateProp) {
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              DropdownPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'start',
                options: digits,
              ),
              DropdownPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'end',
                options: digits,
              ),
            ],
          );
        },
        widgetBuilder: (ctx, props) {
          final initial = int.tryParse(props['start']) ?? 0;
          final current = int.tryParse(props['end']) ?? 2;

          return StatefulBuilder(builder: (ctx, setState) {
            return Column(
              children: <Widget>[
                SingleDigit(
                  initialValue: initialVal,
                  finalValue: finalVal,
                  textStyle: TextStyles.style_20_30_regular,
                ),
                const SizedBox(height: 10),
                RaisedButton(
                  child: const Text('Animate', style: const TextStyle(color: Colors.white)),
                  onPressed: () {
                    setState(() {
                      initialVal = initial;
                      finalVal = current;
                    });
                  },
                ),
              ],
            );
          });
        },
      ),
    );
  }
}

class _MultipleDigits extends StatelessWidget {
  double _initial = 3.98;
  double _final = 3.99;

  @override
  Widget build(BuildContext context) {
    return ExpandableStory(
      title: 'Multiple Digits (runs)',
      child: Builder(builder: (ctx) {
        final runStyle = TextStyles.style_40_60_regular;

        return StatefulBuilder(builder: (ctx, setState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 10),
              Odometer(
                _getTextRuns(_initial, _final, runStyle),
                key: Key('${_initial * _final}'),
              ),
              const SizedBox(height: 10),
              RaisedButton(
                child: const Text('update', style: const TextStyle(color: Colors.white)),
                onPressed: () {
                  setState(() {
                    _initial = _final;
                    _final = _initial * 1.2;
                  });
                },
              )
            ],
          );
        });
      }),
    );
  }

  List<TextRun> _getTextRuns(double val, double newVal, TextStyle textStyle) {
    final parts = '${val.toStringAsFixed(2)}'.split('.');
    if (parts.length == 2) {
      parts.insert(1, '.');
    }

    final newParts = '${newVal.toStringAsFixed(2)}'.split('.');
    if (newParts.length == 2) {
      newParts.insert(1, '.');
    }
    final runs = <TextRun>[
      TextRun(newParts[0], parts[0], textStyle),
    ];

    if (parts.length > 1) {
      runs.add(TextRun(newParts[1], parts[1], textStyle));
    }

    if (parts.length > 2) {
      runs.add(TextRun(newParts[2], parts[2], textStyle));
    }
    return runs;
  }
}
