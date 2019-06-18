import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_kit/color.dart';

class SliverTemplate extends StatelessWidget {

  final SvgPicture svgPicture;
  final Widget bottomButton;
  final Widget copy;
  final List<Widget> sliverList;

  const SliverTemplate({this.svgPicture, this.bottomButton, this.copy, this.sliverList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: false,
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 250.0,
                pinned: true,
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
        child: bottomButton);
  }

  Widget appBarBody(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(4.00),
              child: svgPicture),
          Padding(
              padding: const EdgeInsets.only(top: 10.00),
              child: copy),
        ],
      ),
    );
  }
}