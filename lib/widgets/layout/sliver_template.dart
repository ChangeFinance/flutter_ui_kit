import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ui_kit/color.dart';

import 'custom_flexible_space_bar.dart';

class SliverTemplate extends StatelessWidget {
  final Widget pinWidget;
  final Widget content;
  final List<Widget> sliverList;
  final bool isPinned;
  final Widget appBarTitleWidget;
  final Widget backgroundWidget;
  final FloatingActionButton floatingActionButton;
  final ScrollController scrollController;
  final double heightAsPercentageOfScreenWidth;

  const SliverTemplate({
    this.content = const SizedBox.shrink(),
    this.sliverList,
    this.pinWidget = const SizedBox.shrink(),
    this.isPinned = true,
    this.appBarTitleWidget = const SizedBox.shrink(),
    this.backgroundWidget = const SizedBox.shrink(),
    this.floatingActionButton,
    this.scrollController,
    this.heightAsPercentageOfScreenWidth = 0.7,
  });

  double _getSliverAppBarHeight(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth * heightAsPercentageOfScreenWidth;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      floatingActionButton: floatingActionButton,
      body: CustomScrollView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: _getSliverAppBarHeight(context),
            pinned: isPinned,
            forceElevated: true,
            elevation: 2,
            automaticallyImplyLeading: false,
            backgroundColor: AppColor.deepWhite,
            title: appBarTitleWidget,
            flexibleSpace: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 20.0,
                ),
              ]),
              child: CustomFlexibleSpaceBar(
                centerTitle: true,
                title: content,
                collapseMode: CollapseMode.pin,
                background: Container(
                  child: backgroundWidget,
                  decoration: const BoxDecoration(
                    color: AppColor.deepWhite,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              sliverList,
            ),
          ),
        ],
      ),
    );
  }
}
