import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import '../props_explorer.dart';

class DropdownPropUpdater extends StatefulWidget {
  final Map<String, dynamic> props;
  final PropUpdater updateProp;
  final String propKey;
  final List<String> options;

  DropdownPropUpdater({
    required this.props,
    required this.updateProp,
    required this.propKey,
    required this.options,
    Key? key,
  })  : assert(props != null),
        assert(updateProp != null),
        assert(propKey != null),
        assert(props[propKey] != null),
        assert(options != null),
        assert(props[propKey] is String),
        super(key: key);

  @override
  _DropdownPropUpdaterState createState() => _DropdownPropUpdaterState();
}

class _DropdownPropUpdaterState extends State<DropdownPropUpdater> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context){
    dropdownValue ??= widget.props[widget.propKey];

    return ListTile(
      title: Text(_getLabel()),
      trailing: DropdownButton(
        value: dropdownValue,
        onChanged: (String? newValue) {
          dropdownValue = newValue;
          widget.updateProp(widget.propKey, newValue);
        },
        items: widget.options
            .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
      ),
    );
  }

  String _getLabel() {
    return ReCase(widget.propKey).titleCase;
  }
}
