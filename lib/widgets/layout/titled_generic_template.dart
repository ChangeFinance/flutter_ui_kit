import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/widgets/layout/page_template.dart';
import 'package:flutter_svg/svg.dart';

import 'app_bar.dart';

class TitledGenericTemplate extends StatelessWidget {

  final Widget? leadingWidget;
  final List<Widget>? tailingWidget;

  final Widget? title;
  final SvgPicture? picture;
  final Widget child;
  final Widget? formSubmitAction;

  const TitledGenericTemplate(this.child, this.formSubmitAction, {this.leadingWidget, this.tailingWidget, this.title, this.picture,})
      : super();

  @override
  Widget build(BuildContext context) {
    final scrollChildren = <Widget>[];
    if (_prepareImage() != null) {
      scrollChildren.add(_prepareImage()!);
    }
    scrollChildren.add(child);

    return PageTemplate(
      appBar: MainAppBar(
        implyLeading: leadingWidget != null, leadingWidget: leadingWidget, tailingWidget: tailingWidget,
        centerTitle: true, title: title,),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[ Expanded(flex: 1, child:
            SingleChildScrollView(
              child: Column(
                children: scrollChildren))),
            Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: formSubmitAction ?? const SizedBox.shrink(),
                  )
          ],
        ),
      ),
    );
  }

  Widget? _prepareImage() {
    if (picture != null) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 34.0),
        child: Align(alignment: Alignment.bottomCenter, child:picture),
      );
    }
    return null;
  }
}