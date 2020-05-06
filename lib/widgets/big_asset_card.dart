import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/widgets.dart';

class BigAssetCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final String description;
  final String tag;
  final bool tagIsBadge;

  BigAssetCard(
      {@required this.icon, @required this.title, @required this.description, this.tag, this.tagIsBadge = false});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: AppColor.deepWhite,
      elevation: 2,
      borderRadius: 2,
      child: Container(
        width: 156,
        height: 250,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FittedBox(
                fit: BoxFit.cover,
                alignment: Alignment.center,
                child: SizedBox(width: 24, height: 62, child: icon),
              ),
              const SizedBox(height: 12),
              Text(title, style: const TextStyle(fontSize: 14, height: 20 / 14)),
              const SizedBox(height: 4),
              Text(description, style: const TextStyle(fontSize: 20, height: 30 / 20)),
              const SizedBox(height: 60),
              _buildTag(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTag() {
    if (tag == null || tag.trim().isEmpty) {
      return Container();
    }

    if (tagIsBadge) {
      return _buildBadge();
    }

    return Text(tag, style: const TextStyle(fontSize: 14, height: 20 / 14, color: AppColor.semiGrey));
  }

  Widget _buildBadge() {
    const badgeStyle =
        const TextStyle(fontSize: 12, letterSpacing: 1, fontWeight: FontWeight.w600, color: Colors.white);
    return Container(
      decoration: const BoxDecoration(color: AppColor.green, borderRadius: const BorderRadius.all(Radius.circular(10))),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      height: 20,
      child: Center(
        child: Text(
          tag,
          style: badgeStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
