import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';



class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget leadingWidget;
  final List<Widget> tailingWidget;
  final Widget title;
  final bool centerTitle;
  final bool implyLeading;

  const MainAppBar({this.title, this.centerTitle = false, this.implyLeading = true, this.leadingWidget, this.tailingWidget});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leadingWidget,
      actions: tailingWidget,
      automaticallyImplyLeading: implyLeading,
      title: title,
      centerTitle: centerTitle,
      backgroundColor: Colors.white,
      elevation: 0.0,
      iconTheme:
      Theme.of(context).iconTheme.copyWith(color: AppColor.green),
    );
  }
}