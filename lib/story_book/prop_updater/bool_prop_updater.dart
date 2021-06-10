import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import '../props_explorer.dart';

class BoolPropUpdater extends StatelessWidget {
  final Map<String, dynamic> props;
  final PropUpdater updateProp;
  final String propKey;

  BoolPropUpdater({
    required this.props,
    required this.updateProp,
    required this.propKey,
    Key? key,
  })  : assert(props[propKey] is bool),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(_getLabel()),
      value: props[propKey],
      onChanged: (bool value) {
        updateProp(propKey, value);
      },
    );
  }

  String _getLabel() {
    return ReCase(propKey).titleCase;
  }
}