import 'package:flutter/material.dart';

typedef PropUpdater = void Function(String name, dynamic value);

typedef WidgetBuilder = Widget Function(
  BuildContext context,
  Map<String, dynamic> props,
);

typedef FormBuilder = Widget Function(
  BuildContext context,
  Map<String, dynamic> props,
  PropUpdater updateProp,
);

class PropsExplorer extends StatefulWidget {
  final Map<String, dynamic> initialProps;
  final WidgetBuilder widgetBuilder;
  final FormBuilder formBuilder;

  PropsExplorer({
    required this.initialProps,
    required this.widgetBuilder,
    required this.formBuilder,
    Key? key,
  })  : super(key: key);

  @override
  _PropsExplorerState createState() => _PropsExplorerState();
}

class _PropsExplorerState extends State<PropsExplorer> {
  late Map<String, dynamic> _props;

  @override
  void initState() {
    _props = widget.initialProps;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        widget.formBuilder(context, _props, _updateProp),
        const Divider(),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: widget.widgetBuilder(context, _props),
        ),
      ],
    );
  }

  void _updateProp(String name, dynamic value) {
    setState(() {
      final newProps = Map<String, dynamic>.from(_props);
      newProps[name] = value;
      _props = newProps;
    });
  }
}
