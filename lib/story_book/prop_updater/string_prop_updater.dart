import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import '../props_explorer.dart';

class StringPropUpdater extends StatefulWidget {
  final Map<String, dynamic> props;
  final PropUpdater updateProp;
  final String propKey;
  final String hintText;

  StringPropUpdater({
    required this.props,
    required this.updateProp,
    required this.propKey,
    this.hintText = '',
    Key? key,
  })  : assert(props[propKey] != null),
        assert(props[propKey] is String),
        super(key: key);

  @override
  _StringPropUpdaterState createState() => _StringPropUpdaterState();
}

class _StringPropUpdaterState extends State<StringPropUpdater> {
  TextEditingController? _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    _controller!.text = widget.props[widget.propKey];
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
        onChanged: (String value) {
          widget.updateProp(widget.propKey, value);
        },
      ),
    );
  }

  String _getLabel() {
    return ReCase(widget.propKey).titleCase;
  }
}
