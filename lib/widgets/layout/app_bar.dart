import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';



class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leadingWidget;
  final List<Widget>? tailingWidget;
  final Widget? title;
  final bool centerTitle;
  final bool implyLeading;
  final bool showProgress;
  final int flowStep;
  final int flowStepsNumber;

  const MainAppBar({this.title, this.centerTitle = false, this.implyLeading = true, this.leadingWidget, this.tailingWidget,
      this.showProgress = false,
      this.flowStep = 0,
      this.flowStepsNumber = 0
  });

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
        flexibleSpace: showProgress && flowStepsNumber > 0? _progressWidget(context) : Container()
    );
  }

  Widget _progressWidget(BuildContext context) {
    final children = <Widget>[];
    for (var i = 0; i < flowStepsNumber; i++) {
      if (i < flowStep) {
        children.add(
          Expanded(
            child: Container(
              height: 1.0,
              width: 15.0,
              decoration: const BoxDecoration(
                color: AppColor.green,
              ),),
          )
        );
      } else {
        children.add(
          Expanded(
            child: Container(
              height: 1.0,
              width: 15.0,
              decoration: const BoxDecoration(
                color: AppColor.lightestGrey,
              ),),
          )
        );
      }
    }
    return Padding(
      padding: new EdgeInsets.only(
          top: MediaQuery.of(context).padding.top
      ),
      child:
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: children,
        ),
      )
    );
  }
}
