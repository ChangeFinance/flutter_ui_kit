import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/widgets/layout/app_bar.dart';
import 'package:flutter_ui_kit/widgets/layout/page_template.dart';
import 'package:flutter_ui_kit/widgets/switcher.dart';
import 'package:flutter_ui_kit/widgets/text/numpad_text.dart';

class BuySellTemplate extends StatelessWidget {
  final String mainTitle;
  final String subTitle;
  final Widget action;
  final String showcaseLabel;
  final Widget showcase;
  final List<String> switcherButtonLabels;
  final List<String> switcherValues;

  const BuySellTemplate(
      {this.action,
      this.mainTitle,
      this.subTitle,
      this.showcaseLabel,
      this.showcase,
      this.switcherButtonLabels,
      this.switcherValues});

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
            Text(mainTitle,
                style: theme.display1.copyWith(color: AppColor.deepBlack),
                textAlign: TextAlign.left),
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
              child: _buildContent(context),
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

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 20),
        Switcher(
          buttonLabels: switcherButtonLabels ?? [''],
          values: switcherValues ?? [''],
        ),
        const SizedBox(height: 20),
        _buildShowcase(context),
        _buildNumPad(),
      ],
    );
  }

  Widget _buildNumPad() {
    return Container(
      height: 240,
      child: NumPadText(onChange: (val) {}, decimalPlaces: 2),
    );
  }

  Widget _buildShowcase(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          showcaseLabel ?? '',
          style: theme.textTheme.body2.copyWith(color: AppColor.semiGrey),
        ),
        Expanded(child: Container()),
        showcase ?? Container(),
      ],
    );
  }
}
