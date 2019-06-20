import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import 'dots_indicator.dart';

class AppSlider extends StatelessWidget {
  final List<Widget> slides;
  final PageController pageController;

  final EdgeInsetsGeometry dotsPadding;
  final double dotSize;
  final double distanceBetweenCenterOfDots;

  const AppSlider(
      {@required this.slides,
      @required this.pageController,
      this.dotsPadding = const EdgeInsets.all(20.0),
      this.dotSize,
      this.distanceBetweenCenterOfDots})
      : assert(slides != null),
        assert(pageController != null);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [buildSlidePageViews(), buildDots()]);
  }

  Widget buildSlidePageViews() {
    return PageView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: pageController,
        itemCount: slides.length,
        itemBuilder: (BuildContext context, int index) {
          return slides.elementAt(index);
        });
  }

  Widget buildDots() {
    return new Container(
      padding: dotsPadding,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          new DotsIndicator(
            controller: pageController,
            itemCount: slides.length,
            onPageSelected: (int page) {
              pageController.animateToPage(
                page,
                duration: const Duration(milliseconds: 100),
                curve: Curves.ease,
              );
            },
          )
        ],
      ),
    );
  }
}
