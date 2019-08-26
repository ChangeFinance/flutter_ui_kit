import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/widgets/layout/app_bar.dart';
import 'package:flutter_ui_kit/widgets/layout/page_template.dart';

class BuySellTemplate extends StatelessWidget {
  final String mainTitle;
  final String subTitle;
  final Widget action;
  final Widget child;

  const BuySellTemplate(
      {this.child, this.action, this.mainTitle, this.subTitle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return PageTemplate(
      appBar: MainAppBar(
        leadingWidget: const CloseButton(),
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(mainTitle, style: theme.display1, textAlign: TextAlign.left),
            const SizedBox(height: 5),
            Text(
              subTitle,
              style: theme.body2.copyWith(color: AppColor.semiGrey),
            ),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Expanded(
              key: const Key('childExpandedContainer'),
              flex: 1,
              child: child,
            ),
            Padding(
                key: const Key('actionPadding'),
                padding: const EdgeInsets.all(10),
                child: action),
          ],
        ),
      ),
    );
  }
}
