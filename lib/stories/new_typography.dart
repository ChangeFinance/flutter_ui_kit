import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/story_book/story.dart';
import 'package:flutter_ui_kit/text_styles.dart';
import 'package:responsive_grid/responsive_grid.dart';

class NewTypography extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Story(
              child: _buildStoryRow(context, TextStyles.style_48_52_bold, 'Only for super-large titles',
                  'Change Invest', 'Change\nInvest'),
              title: '',
            ),
            Story(
              child: _buildStoryRow(
                  context,
                  TextStyles.style_40_60_regular,
                  'Only for large number values in \nasset, transactions and card screens',
                  'Change Invest',
                  'Change\nInvest'),
              title: '',
            ),
            Story(
              child: _buildStoryRow(
                  context,
                  TextStyles.style_32_36_bold,
                  'Page title (unscrolled), large\n number values in confirmation and\n trade flow screens',
                  'Change Invest',
                  'Change\nInvest'),
              title: '',
            ),
            Story(
              child: _buildStoryRow(
                  context, TextStyles.style_24_36_bold, 'Secondary title', 'Change Invest', 'Change\nInvest'),
              title: '',
            ),
            Story(
              child: _buildStoryRow(
                  context,
                  TextStyles.style_20_30_regular,
                  'Only for small number value in\n asset’s and transactions screen',
                  'Change Invest',
                  'Change\nInvest'),
              title: '',
            ),
            Story(
              child: _buildStoryRow(
                  context,
                  TextStyles.style_16_24_regular,
                  'Primary body text, links,\n buttons, list items confirmation screen',
                  'Change Invest',
                  'Change\nInvest'),
              title: '',
            ),
            Story(
              child: _buildStoryRow(
                  context,
                  TextStyles.style_16_24_bold,
                  'Page title (scrolled), static\n header, assets, price and portfolio\n sections header, important items\n '
                      'in confirmation screen list,\n transaction’s details important\n items, amount in assets’ card in\n '
                      'the asset’s page',
                  'Change Invest',
                  'Change\nInvest'),
              title: '',
            ),
            Story(
              child: _buildStoryRow(
                  context,
                  TextStyles.style_14_20_regular,
                  'Secondary body text, \ntransactions title, amount, and date.\n'
                      ' text input, error message, price\n label on graph, price filter button,\n transaction details title, percentage\n flactuation amount',
                  'Change Invest',
                  'Change\nInvest'),
              title: '',
            ),
            Story(
              child: _buildStoryRow(
                  context, TextStyles.style_10_14_regular, 'Action bar labels', 'Change Invest', 'Change\nInvest'),
              title: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStoryRow(BuildContext context, TextStyle textStyle, String useDescription, String singleLineSample,
      String multiLineSample) {
    return ResponsiveGridRow(
      children: <ResponsiveGridCol>[
        ResponsiveGridCol(
          child: _buildStyleInfo(context, textStyle, useDescription),
          xl: 3,
          lg: 3,
          md: 12,
          sm: 12,
          xs: 12,
        ),
        ResponsiveGridCol(
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              singleLineSample,
              style: textStyle,
            ),
          ),
          xl: 3,
          lg: 3,
          md: 6,
          sm: 6,
          xs: 12,
        ),
        ResponsiveGridCol(
          child: Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              multiLineSample,
              style: textStyle,
            ),
          ),
          xl: 3,
          lg: 3,
          md: 6,
          sm: 6,
          xs: 12,
        ),
      ],
    );
  }

  Widget _buildStyleInfo(BuildContext context, TextStyle textStyle, String useDescription) {
    const titleTextStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: 16,
      height: 24 / 16,
      letterSpacing: 0.02 / TextStyles.letterSpacingConstant,
    );

    final sz = textStyle.fontSize.toInt();
    final lh = (sz * textStyle.height).toInt();
    final lhPct = ((lh / sz) * 100).ceil();
    final sp = ((textStyle.letterSpacing == null ?? textStyle.letterSpacing == 0.0
                ? 0
                : textStyle.letterSpacing * TextStyles.letterSpacingConstant) *
            100)
        .toInt();
    final fw = textStyle.fontWeight == FontWeight.bold ? 'bold' : 'regular';
    final title = '${sz}px / ${lh}px / $sp% spacing / $fw';

    final subTitle1 = '$lhPct% line height (${lh}px)';
    final subTitle2 = 'Use: $useDescription';

    return Row(
      children: <Widget>[
        Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            color: AppColor.green,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: titleTextStyle,
              softWrap: true,
            ),
            Text(
              subTitle1,
              style: titleTextStyle.copyWith(color: const Color(0xFF9DA0A6), fontWeight: FontWeight.normal),
              softWrap: true,
            ),
            const SizedBox(height: 10),
            Text(
              subTitle2,
              style: titleTextStyle.copyWith(
                  color: const Color(0xFF9DA0A6), fontSize: 14, height: 20 / 14, fontWeight: FontWeight.normal),
              softWrap: true,
              overflow: TextOverflow.clip,
            ),
          ],
        ),
      ],
    );
  }
}
