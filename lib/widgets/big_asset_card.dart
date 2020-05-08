import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/text_styles.dart';
import 'package:flutter_ui_kit/ui/screen_utils.dart';
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
    final descriptionStyle =
        ScreenUtils.isSmallScreen(context) ? TextStyles.style_20_30_regular : TextStyles.style_20_30_regular;
    return AppCard(
      color: AppColor.deepWhite,
      elevation: 2,
      borderRadius: 4,
      child: Container(
        constraints: BoxConstraints.loose(Size(156, ScreenUtils.isSmallScreen(context) ? 200 : 220)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FittedBox(
                fit: BoxFit.cover,
                alignment: Alignment.center,
                child: SizedBox(width: 24, height: 24, child: icon),
              ),
              const SizedBox(height: 12),
              Text(title, style: TextStyles.style_14_20_regular.copyWith(color: Colors.black)),
              const SizedBox(height: 4),
              FittedBox(
                child: SizedBox(
                  child: Text(description, style: descriptionStyle.copyWith(color: Colors.black)),
                  height: descriptionStyle.height * descriptionStyle.fontSize,
                ),
              ),
              Spacer(),
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

    return FittedBox(
      child: SizedBox(
        height: 20,
        child: Text(tag, style: TextStyles.style_14_20_regular.copyWith(color: AppColor.semiGrey)),
      ),
    );
  }

  Widget _buildBadge() {
    const badgeStyle =
        const TextStyle(fontSize: 12, letterSpacing: 1, fontWeight: FontWeight.w600, color: Colors.white);
    return FittedBox(
      child: Container(
        decoration:
            const BoxDecoration(color: AppColor.green, borderRadius: const BorderRadius.all(Radius.circular(10))),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        height: 20,
        child: Center(
          child: Text(
            tag,
            style: badgeStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
