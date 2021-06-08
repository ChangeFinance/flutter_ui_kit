import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import '../props_explorer.dart';

class IntPropUpdater extends StatefulWidget {
  final Map<String, dynamic> props;
  final PropUpdater updateProp;
  final String propKey;
  final String hintText;

  IntPropUpdater({
    required this.props,
    required this.updateProp,
    required this.propKey,
    this.hintText = '',
    Key? key,
  })  : assert(props != null),
        assert(updateProp != null),
        assert(propKey != null),
        assert(props[propKey] != null),
        assert(props[propKey] is int),
        super(key: key);

  @override
  _IntPropUpdaterState createState() => _IntPropUpdaterState();
}

class _IntPropUpdaterState extends State<IntPropUpdater> {
  TextEditingController? _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    _controller!.text = widget.props[widget.propKey].toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: _getLabel(),
          hintText: widget.hintText.isNotEmpty ? widget.hintText : _getLabel(),
        ),
        keyboardType: TextInputType.number,
        onChanged: (String value) {
          widget.updateProp(widget.propKey, int.tryParse(value) ?? widget.props[widget.propKey]);
        },
      ),
    );
  }

  String _getLabel() {
    return ReCase(widget.propKey).titleCase;
  }
}
