import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ui_kit/color.dart';

class SliverTemplate extends StatelessWidget {

  final Widget pinWidget;
  final Widget content;
  final List<Widget> sliverList;
  final bool isPinned;

  const SliverTemplate(this.content, this.sliverList, this.pinWidget, {this.isPinned});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: false,
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 250.0,
                pinned: isPinned,
                forceElevated: false,
                elevation: 0,
                automaticallyImplyLeading: false,
                backgroundColor: AppColor.deepWhite,
                bottom: appBarBottom(context),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  titlePadding: const EdgeInsets.only(top: 90.00),
                  title: appBarBody(context),
                  collapseMode: CollapseMode.pin,
                  background: Container(
                      decoration: const BoxDecoration(color: AppColor.deepWhite)),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate(
                    sliverList,
                  )),
            ]));
  }


  Widget appBarBottom(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size(10.00, 10.00),
        child: pinWidget);
  }

  Widget appBarBody(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: content
    );
  }
}