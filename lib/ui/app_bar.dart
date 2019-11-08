import 'package:flutter/material.dart';

import 'colors.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final Widget leading;
  final bool centerTitle;
  final bool implyLeading;
  final Color backgroundColor;
  final List<Widget> actions;

  const MainAppBar({this.title, this.leading, this.centerTitle = false, this.implyLeading = true, this.backgroundColor, this.actions = const <Widget>[]});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      automaticallyImplyLeading: implyLeading,
      title: title,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: 0.0,
      actions: actions,
      iconTheme:
          Theme.of(context).iconTheme.copyWith(color: AppColors.secondary),
    );
  }
}
