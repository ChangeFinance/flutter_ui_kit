import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_kit/widgets/layout/page_template.dart';
import 'package:flutter_ui_kit/widgets/slider/layout/utility_slide.dart';
import 'package:flutter_ui_kit/widgets/slider/slider.dart';

class Sliders extends StatelessWidget {
  static const String sliderRoute = '/slider-page';
  final _controller = new PageController();

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
        padding: const EdgeInsets.all(30.0),
        child: AppSlider(
          slides: <Widget>[
            buildSlideOne(),
            buildSlideTwo(),
            buildSlideThree(),
          ],
          pageController: _controller,
        ));
  }

  Widget buildSlideOne() {
    return UtilitySlide(
      'Pre-order your card',
      'Convert instantly between your currencies and spend with your card world wide',
      SvgPicture.asset(
        'assets/card_holder.svg',
        width: 285.0,
        height: 215.0,
      ),
    );
  }

  Widget buildSlideTwo() {
    return UtilitySlide(
      'Buy and trade cryptos',
      'Get started with Bitcoin, Ethereum, and more with zero fees.',
      SvgPicture.asset(
        'assets/free_trading.svg',
        width: 285.0,
        height: 215.0,
      ),
    );
  }

  Widget buildSlideThree() {
    return UtilitySlide(
      'Secure funds',
      'Your funds are protected in multi-signature, '
          'cold-storage cryptocurrency accounts',
      SvgPicture.asset(
        'assets/secure_funds.svg',
        width: 285.0,
        height: 215.0,
      ),
    );
  }
}
