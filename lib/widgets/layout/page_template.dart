import 'package:flutter/material.dart';

class PageTemplate extends StatelessWidget {
  final Widget child;
  final Widget bottomNavigationBar;
  final Widget floatingActionButton;
  final PreferredSizeWidget appBar;
  final EdgeInsets padding;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const PageTemplate(
      {this.child,
        this.bottomNavigationBar,
        this.appBar,
        this.floatingActionButton,
        this.scaffoldKey,
        this.padding = const EdgeInsets.symmetric(horizontal: 16.0)});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: appBar,
        backgroundColor: Colors.white,
        body: Padding(
            padding: padding,
            child: SafeArea(
              child: GestureDetector(
                  onTap: () {
                    //https://github.com/flutter/flutter/issues/7247
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },
                  child: child),
            )),
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomNavigationBar);
  }
}
