import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/widgets/layout/page_template.dart';
import 'package:flutter_ui_kit/widgets/text/heading.dart';

import 'app_bar.dart';

class GenericTemplate extends StatelessWidget {

  final Widget? leadingWidget;
  final List<Widget>? tailingWidget;

  final ChgHeading header;
  final Widget child;
  final Widget formSubmitAction;

  const GenericTemplate(this.header, this.child, this.formSubmitAction, {this.leadingWidget, this.tailingWidget})
      : super();

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      appBar: MainAppBar(
        implyLeading: leadingWidget != null, leadingWidget: leadingWidget, tailingWidget: tailingWidget,),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Align(alignment: Alignment.centerLeft, child:header),
            ),
            Expanded(flex: 1, child: child),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: formSubmitAction,
            )
          ],
        ),
      ),
    );
  }
}