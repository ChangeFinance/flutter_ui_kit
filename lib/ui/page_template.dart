import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PageTemplate extends StatefulWidget {
  final Widget? child;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? appBar;
  final EdgeInsets padding;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final bool dismissKeyboardOnTap;

  const PageTemplate({
    this.child,
    this.bottomNavigationBar,
    this.appBar,
    this.floatingActionButton,
    this.scaffoldKey,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.dismissKeyboardOnTap = true,
  });

  @override
  _PageTemplateState createState() => _PageTemplateState();
}

class _PageTemplateState extends State<PageTemplate> {
  @override
  void initState() {
    _dismissKeyboard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      appBar: widget.appBar,
      backgroundColor: Colors.white,
      body: Padding(
          padding: widget.padding,
          child: SafeArea(
            child: widget.dismissKeyboardOnTap
                ? GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: _dismissKeyboard,
                    child: widget.child)
                : widget.child!,
          )),
      floatingActionButton: widget.floatingActionButton,
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }

  void _dismissKeyboard() {
    // https://github.com/flutter/flutter/issues/7247
    SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
  }
}
