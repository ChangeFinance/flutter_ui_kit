import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/story_book/props_explorer.dart';
import 'package:recase/recase.dart';

abstract class ListPropUpdater<T> extends StatefulWidget {
  final Map<String, dynamic> props;
  final PropUpdater updateProp;
  final String propKey;
  final String hintText;

  ListPropUpdater({
    @required this.props,
    @required this.updateProp,
    @required this.propKey,
    this.hintText = '',
    Key key,
  })  : assert(props != null),
        assert(updateProp != null),
        assert(propKey != null),
        assert(props[propKey] != null),
        assert(props[propKey] is List),
        super(key: key);

  @override
  _ListPropUpdaterState createState() => _ListPropUpdaterState();

  String listToText(List<T> list);

  List<T> textToList(String text);
}

class _ListPropUpdaterState extends State<ListPropUpdater> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    final List<String> list = widget.props[widget.propKey];
//    _controller.text = list.join(',');
    _controller.text = widget.listToText(list);
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
//          final values = value.split(',');
          final values = widget.textToList(value);
          widget.updateProp(widget.propKey, values);
        },
      ),
    );
  }

  String _getLabel() {
    return ReCase(widget.propKey).titleCase;
  }
}
