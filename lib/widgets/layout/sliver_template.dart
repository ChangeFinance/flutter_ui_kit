import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ui_kit/color.dart';

import 'custom_flexible_space_bar.dart';

class SliverTemplate extends StatefulWidget {
  static double heightAsPercentageOfScreenWidth = 0.7; 

  final Widget pinWidget;
  final Widget content;
  final List<Widget> sliverList;
  final bool isPinned;
  final Widget appBarTitleWidget;
  final Widget backgroundWidget;
  final FloatingActionButton floatingActionButton;
  final ScrollController scrollController;


  const SliverTemplate({
    this.content = const SizedBox.shrink(),
    this.sliverList,
    this.pinWidget = const SizedBox.shrink(),
    this.isPinned = true,
    this.appBarTitleWidget = const SizedBox.shrink(),
    this.backgroundWidget = const SizedBox.shrink(),
    this.floatingActionButton,
    this.scrollController,
  });

  static double getSliverAppBarHeight(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth * heightAsPercentageOfScreenWidth;
  }

  @override
  _SliverTemplateState createState() => _SliverTemplateState();
}

class _SliverTemplateState extends State<SliverTemplate> {
  final GlobalKey topAppBarKey = GlobalKey<_SliverTemplateState>();

  bool collapsed = false;

  void _scrollListener(double offset, BuildContext context) {
    final sliverAppBarHeight = SliverTemplate.getSliverAppBarHeight(context);
    final topAppBarBox =
        // ignore: avoid_as
        topAppBarKey.currentContext.findRenderObject() as RenderBox;
    final topAppBarHeight = topAppBarBox.size.height;
    if (sliverAppBarHeight - offset <= topAppBarHeight) {
      setState(() {
        collapsed = true;
      });
    } else {
      setState(() {
        collapsed = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: widget.floatingActionButton,
      body: NotificationListener<ScrollNotification>(
        onNotification: (sn) {
          _scrollListener(sn.metrics.pixels, context);
        },
        child: CustomScrollView(
          controller: widget.scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: SliverTemplate.getSliverAppBarHeight(context),
              pinned: widget.isPinned,
              forceElevated: collapsed,
              elevation: collapsed ? 1 : 0,
              automaticallyImplyLeading: false,
              backgroundColor: AppColor.deepWhite,
              title: Container(
                key: topAppBarKey,
                constraints: const BoxConstraints.expand(),
                child: widget.appBarTitleWidget,
              ),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  boxShadow: collapsed
                      ? []
                      : [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 20.0,
                          ),
                        ],
                ),
                child: CustomFlexibleSpaceBar(
                  centerTitle: true,
                  title: widget.content,
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    child: widget.backgroundWidget,
                    decoration: const BoxDecoration(
                      color: AppColor.deepWhite,
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                widget.sliverList,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
