import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/story_book/props_explorer.dart';
import 'package:recase/recase.dart';

class ListPropUpdater<T> extends StatefulWidget {
  final Map<String, dynamic> props;
  final PropUpdater updateProp;
  final String propKey;
  final String hintText;
  final String Function<T>(List<T> list) listToTextConverter;
  final List<T> Function(String text) textToListConverter;

  ListPropUpdater({
    @required this.props,
    @required this.updateProp,
    @required this.propKey,
    @required this.listToTextConverter,
    @required this.textToListConverter,
    this.hintText = '',
    Key key,
  })  : assert(props != null),
        assert(updateProp != null),
        assert(propKey != null),
        assert(props[propKey] != null),
        assert(props[propKey] is List),
        assert(listToTextConverter != null),
        assert(textToListConverter != null),
        super(key: key);

  @override
  _ListPropUpdaterState createState() => _ListPropUpdaterState();
}

class _ListPropUpdaterState extends State<ListPropUpdater> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    final List<String> list = widget.props[widget.propKey];
    _controller.text = widget.listToTextConverter(list);
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
          final values = widget.textToListConverter(value);
          widget.updateProp(widget.propKey, values);
        },
      ),
    );
  }

  String _getLabel() {
    return ReCase(widget.propKey).titleCase;
  }
}
