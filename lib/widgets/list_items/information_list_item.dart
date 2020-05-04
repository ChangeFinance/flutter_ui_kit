import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';

class InformationListItem extends StatelessWidget {
  final Widget icon;
  final String title;
  final String information;
  final String badgeText;
  final String linkText;

  const InformationListItem(
    this.linkText,
    this.badgeText, {
    @required this.icon,
    @required this.title,
    @required this.information,
  });

  bool get hasBadge => badgeText != null && badgeText.trim().isNotEmpty;

  bool get hasLink => linkText != null && linkText.trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FittedBox(
          fit: BoxFit.cover,
          alignment: Alignment.center,
          child: SizedBox(width: 64, height: 64, child: icon),
        ),
        const SizedBox(width: 16),
        Expanded(child: _buildBody()),
      ],
    );
  }

  Widget _buildBody() {
    const titleStyle = TextStyle(fontSize: 16, height: 24 / 16, fontWeight: FontWeight.w600);
    const informationStyle = const TextStyle(fontSize: 14, height: 20 / 14, color: AppColor.semiGrey);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              title,
              textAlign: TextAlign.start,
              style: titleStyle,
            ),
            const SizedBox(width: 5),
            hasBadge ? _buildBadge() : Container(),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          information,
          textAlign: TextAlign.start,
          style: informationStyle,
        ),
        const SizedBox(height: 4),
        hasLink
            ? Text(
                linkText,
                textAlign: TextAlign.start,
                style: informationStyle.copyWith(color: AppColor.green),
              )
            : Container(),
      ],
    );
  }

  Widget _buildBadge() {
    const badgeStyle = const TextStyle(
        fontSize: 12, height: 16 / 12, letterSpacing: 1, fontWeight: FontWeight.w600, color: Colors.white);
    return Container(
      key: const Key('informationListItemBadge'),
      decoration: BoxDecoration(color: AppColor.green, borderRadius: const BorderRadius.all(Radius.circular(10))),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Center(
        child: Text(
          badgeText,
          style: badgeStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
