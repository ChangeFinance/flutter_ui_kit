import 'package:flutter/material.dart';

import 'package:flutter_ui_kit/ui/app_bar.dart';

import 'package:flutter_ui_kit/text.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/widgets/layout/SwipeConfirmation.dart';

enum SwipeMode { swipe, static }

class SwipeUpToConfirmLayout extends StatefulWidget {
  final String title;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Widget body;
  final Widget swiperDisplay;
  final Function swipeCompleteCallback;
  final String completeScreenLabelTitle;
  final String completeScreenLabelText;
  final Widget completeScreenLabelIcon;
  final SwipeMode swipeMode;
  final String completionPrimaryButtonText;
  final Function completionPrimaryButtonAction;
  final String completionSecondaryButtonText;
  final Function completionSecondaryButtonAction;

  SwipeUpToConfirmLayout({
    @required this.body,
    @required this.swiperDisplay,
    this.title = '',
    this.scaffoldKey,
    this.swipeMode = SwipeMode.swipe,
    this.swipeCompleteCallback,
    this.completeScreenLabelTitle,
    this.completeScreenLabelText,
    this.completeScreenLabelIcon,
    this.completionPrimaryButtonText = 'Primary button',
    this.completionPrimaryButtonAction,
    this.completionSecondaryButtonText = 'Secondary button',
    this.completionSecondaryButtonAction,
  });

  @override
  _SwipeUpToConfirmLayoutState createState() => _SwipeUpToConfirmLayoutState();
}

class _SwipeUpToConfirmLayoutState extends State<SwipeUpToConfirmLayout> with TickerProviderStateMixin {
  final double swiperBaseHeight = 150;

  AnimationController _controller;
  Animation<double> _heightAnimation;
  Animation<double> _opacityAnimation;

  double dyStartPosition = 0;
  double dyEndPosition = 0;
  double dragDistanceThreshold = 150;
  bool isSwipingUp = true;
  bool swipeUpComplete = false;
  bool canShowConfirmView = false;

  static const int swipeUpDuration = 300;
  static const int slideInDuration = 500;

  AnimationController _slideInController;
  Animation<double> _confirmViewLabelTranslation;
  Animation<double> _confirmViewButtonTranslation;
  Animation<double> _confirmViewOpacity;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: swipeUpDuration))
      ..addListener(() {
        setState(() {
          final screenHeight = MediaQuery.of(context).size.height;
          final dragDistance = screenHeight * _controller.value;
          if (dragDistance >= dragDistanceThreshold && isSwipingUp) {
            canShowConfirmView = true;
            _slideInController.forward();
          } else if (!isSwipingUp) {
            canShowConfirmView = false;
            _slideInController.animateTo(0);
          }
        });
      })
      ..addStatusListener((AnimationStatus animationStatus) {
        if (animationStatus == AnimationStatus.completed && _controller.value == 1) {
          widget.swipeCompleteCallback?.call();
        }
      });

    _heightAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 1, curve: Curves.easeOut),
      ),
    )..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed && _controller.value == 1) {
          setState(() {
            swipeUpComplete = true;
          });
        }
      });

    _opacityAnimation = Tween<double>(begin: 1, end: 0)
        .animate(CurvedAnimation(parent: _controller, curve: Interval(0, 0.2, curve: Curves.easeOut)));

    _slideInController = AnimationController(vsync: this, duration: const Duration(milliseconds: slideInDuration))
      ..addListener(() {
        setState(() {});
      });
    _confirmViewOpacity = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _slideInController, curve: Interval(0, 0.8, curve: Curves.easeOut)))
          ..addListener(() {
            setState(() {});
          });
    _confirmViewLabelTranslation = Tween<double>(begin: 80, end: 0)
        .animate(CurvedAnimation(parent: _slideInController, curve: Interval(0, 1, curve: Curves.easeOut)));
    _confirmViewButtonTranslation = Tween<double>(begin: 150, end: 0)
        .animate(CurvedAnimation(parent: _slideInController, curve: Interval(0, 1, curve: Curves.easeOut)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        _appbarAndContent(),
        _nextSwiper(),
      ],
    );
  }

  double swiperHeightOffsetYFromAnimation(double animationVal) {
    final screenHeight = MediaQuery.of(context).size.height - swiperBaseHeight;
    final offsetVal = screenHeight * animationVal;
    return offsetVal;
  }

  Widget _appbarAndContent() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: swiperBaseHeight,
      child: Transform.translate(
        offset: Offset(0, -swiperHeightOffsetYFromAnimation(_heightAnimation.value)),
        child: Column(
          children: <Widget>[
            const MainAppBar(centerTitle: true, title: const Text('Confirm limit order', style: AppText.header3)),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          //https://github.com/flutter/flutter/issues/7247
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: widget.body,
      ),
    );
  }

  Widget _nextSwiper() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: GestureDetector(
        onVerticalDragStart:
            widget.swipeMode == SwipeMode.static ? null : (swipeUpComplete ? null : _onVerticalDragStart),
        onVerticalDragUpdate:
            widget.swipeMode == SwipeMode.static ? null : (swipeUpComplete ? null : _onVerticalDragUpdate),
        onVerticalDragEnd: widget.swipeMode == SwipeMode.static ? null : (swipeUpComplete ? null : _onVerticalDragEnd),
        child: Container(
          width: double.infinity,
          height: swiperBaseHeight + swiperHeightOffsetYFromAnimation(_heightAnimation.value),
          decoration: BoxDecoration(
            color: AppColor.green,
            borderRadius: const BorderRadius.only(
              topLeft: const Radius.circular(20),
              topRight: const Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: !canShowConfirmView
                ? Transform.translate(
                    offset: Offset(
                        0,
                        _heightAnimation.value * swiperBaseHeight +
                            swiperHeightOffsetYFromAnimation(_heightAnimation.value)),
                    child: _beforeSwipeUp(),
                  )
                : _afterSwipeUp(),
          ),
        ),
      ),
    );
  }

  Widget _beforeSwipeUp() {
    return Opacity(
      opacity: _opacityAnimation.value,
      child: Column(
        children: <Widget>[
          _handle(),
          widget.swiperDisplay,
        ],
      ),
    );
  }

  Widget _afterSwipeUp() {
    return SwipeConfirmation(
      labelIcon: widget.completeScreenLabelIcon,
      labelTitle: widget.completeScreenLabelTitle,
      labelText: widget.completeScreenLabelText,
      primaryButtonText: widget.completionPrimaryButtonText,
      primaryButtonAction: widget.completionPrimaryButtonAction,
      secondaryButtonText: widget.completionSecondaryButtonText,
      secondaryButtonAction: widget.completionSecondaryButtonAction,
      labelTranslation: _confirmViewLabelTranslation,
      buttonTranslation: _confirmViewButtonTranslation,
      opacity: _confirmViewOpacity,
    );
  }

  void _onVerticalDragStart(DragStartDetails details) {
    debugPrint('Drag Start -> Global position: ${details.globalPosition}, Local position: ${details.localPosition}');
    setState(() {
      dyStartPosition = details.globalPosition.dy;
    });
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    final screenHeight = MediaQuery.of(context).size.height;
    debugPrint(
        'Drag Update -> Global position: ${details.globalPosition}, Local position: ${details.localPosition}, Delta: ${details.primaryDelta}');
    setState(() {
      dyEndPosition = details.globalPosition.dy;
      isSwipingUp = details.primaryDelta <= 0;
    });
    final dragDistance = (dyStartPosition - dyEndPosition).abs();
    _controller.value = dragDistance / screenHeight;
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    debugPrint('Drag End -> Primary velocity: ${details.primaryVelocity}, Velocity: ${details.velocity}');
    debugPrint('DRAG DISTANCE -> ${(dyStartPosition - dyEndPosition).abs()}');

    final dragDistance = (dyStartPosition - dyEndPosition).abs();
    if (details.velocity.pixelsPerSecond.dy.abs() > 1000 && isSwipingUp) {
      _controller.animateTo(1, curve: Curves.easeOut, duration: const Duration(milliseconds: 250));
    } else if (dragDistance < dragDistanceThreshold) {
      _controller.animateTo(0, curve: Curves.easeOut, duration: const Duration(milliseconds: 300));
    } else if (isSwipingUp) {
      _controller.animateTo(1, curve: Curves.easeOut, duration: const Duration(milliseconds: 250));
    } else {
      _controller.animateTo(0, curve: Curves.easeOut, duration: const Duration(milliseconds: 300));
    }
  }

  Widget _handle() {
    final screenWidth = MediaQuery.of(context).size.width;
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColor.darkerGreen,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: SizedBox(width: screenWidth * 0.2, height: 5),
    );
  }
}
