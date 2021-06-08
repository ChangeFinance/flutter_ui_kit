import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import '../props_explorer.dart';

class DoublePropUpdater extends StatelessWidget {
  final Map<String, dynamic> props;
  final PropUpdater updateProp;
  final String propKey;
  final double min;
  final double max;

  DoublePropUpdater({
    required this.props,
    required this.updateProp,
    required this.propKey,
    required this.min,
    required this.max,
    Key? key,
  })  : assert(props != null),
        assert(updateProp != null),
        assert(propKey != null),
        assert(props[propKey] != null),
        assert(props[propKey] is double),
        assert(min != null),
        assert(max != null),
        assert(min <= max),
        assert(props[propKey] >= min && props[propKey] <= max),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _label(),
        _slider()
      ],
    );
  }

  Widget _label() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15,15,15,0),
      child: Text(_getLabelText()),
    );
  }

  Widget _slider() {
    return Slider(
      min: min,
      max: max,
      divisions: (max-min).ceil(),
      value: props[propKey],
      onChanged: (double value) {
        updateProp(propKey, value);
      },
    );
  }

  String _getLabelText() {
    final double value = props[propKey];
    return '${ReCase(propKey).titleCase}: ${value.ceil()}';
  }
}
