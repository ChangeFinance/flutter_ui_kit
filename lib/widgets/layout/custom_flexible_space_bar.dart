// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// https://github.com/flutter/flutter/issues/17887
class CustomFlexibleSpaceBar extends StatefulWidget {
  const CustomFlexibleSpaceBar({
    Key key,
    this.title,
    this.background,
    this.centerTitle,
    this.titlePadding,
    this.collapseMode = CollapseMode.parallax,
  }) : assert(collapseMode != null),
       super(key: key);

  final Widget title;
  final Widget background;
  final bool centerTitle;
  final CollapseMode collapseMode;
  final EdgeInsetsGeometry titlePadding;
  static Widget createSettings({
    @required double currentExtent,
    @required Widget child,
    double toolbarOpacity,
    double minExtent,
    double maxExtent,
  }) {
    assert(currentExtent != null);
    return FlexibleSpaceBarSettings(
      toolbarOpacity: toolbarOpacity ?? 1.0,
      minExtent: minExtent ?? currentExtent,
      maxExtent: maxExtent ?? currentExtent,
      currentExtent: currentExtent,
      child: child,
    );
  }

  @override
  _CustomFlexibleSpaceBarState createState() => _CustomFlexibleSpaceBarState();
}

class _CustomFlexibleSpaceBarState extends State<CustomFlexibleSpaceBar> {
  bool _getEffectiveCenterTitle(ThemeData theme) {
    if (widget.centerTitle != null)
      return widget.centerTitle;
    assert(theme.platform != null);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return false;
      case TargetPlatform.iOS:
        return true;
    }
  }

  Alignment _getTitleAlignment(bool effectiveCenterTitle) {
    if (effectiveCenterTitle)
      return Alignment.bottomCenter;
    final textDirection = Directionality.of(context);
    assert(textDirection != null);
    switch (textDirection) {
      case TextDirection.rtl:
        return Alignment.bottomRight;
      case TextDirection.ltr:
        return Alignment.bottomLeft;
    }
  }

  double _getCollapsePadding(double t, FlexibleSpaceBarSettings settings) {
    switch (widget.collapseMode) {
      case CollapseMode.pin:
        return -(settings.maxExtent - settings.currentExtent);
      case CollapseMode.none:
        return 0.0;
      case CollapseMode.parallax:
        final deltaExtent = settings.maxExtent - settings.minExtent;
        return -Tween<double>(begin: 0.0, end: deltaExtent / 4.0).transform(t);
    }
  }

  @override
  Widget build(BuildContext context) {
    final FlexibleSpaceBarSettings settings = context.inheritFromWidgetOfExactType(FlexibleSpaceBarSettings);
    assert(settings != null, 'A FlexibleSpaceBar must be wrapped in the widget returned by FlexibleSpaceBar.createSettings().');

    final children = <Widget>[];

    final deltaExtent = settings.maxExtent - settings.minExtent;

    // 0.0 -> Expanded
    // 1.0 -> Collapsed to toolbar
    final double t = (1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent).clamp(0.0, 1.0);

    // background image
    if (widget.background != null) {
      final fadeStart = math.max(0.0, 1.0 - kToolbarHeight / deltaExtent);
      const fadeEnd = 1.0;
      assert(fadeStart <= fadeEnd);
      final opacity = 1.0 - Interval(fadeStart, fadeEnd).transform(t);
      if (opacity > 0.0) {
        children.add(Positioned(
          top: _getCollapsePadding(t, settings),
          left: 0.0,
          right: 0.0,
          height: settings.maxExtent,
          child: Opacity(
            opacity: opacity,
            child: widget.background,
          ),
        ));
      }
    }

    if (widget.title != null) {
      Widget title;
      switch (defaultTargetPlatform) {
        case TargetPlatform.iOS:
          title = widget.title;
          break;
        case TargetPlatform.fuchsia:
        case TargetPlatform.android:
          title = Semantics(
            namesRoute: true,
            child: widget.title,
          );
      }

      final theme = Theme.of(context);
      final opacity = settings.toolbarOpacity;
      if (opacity > 0.0) {
        var titleStyle = theme.primaryTextTheme.title;
        titleStyle = titleStyle.copyWith(
          color: titleStyle.color.withOpacity(opacity)
        );
        final effectiveCenterTitle = _getEffectiveCenterTitle(theme);
        final padding = widget.titlePadding ??
          EdgeInsetsDirectional.only(
            start: effectiveCenterTitle ? 0.0 : 72.0,
            bottom: 16.0,
          );
        final scaleValue = Tween<double>(begin: 1.0, end: 2.0/3.0).transform(t);
        final scaleTransform = Matrix4.identity()
          ..scale(scaleValue, scaleValue, 1.0);
        final titleAlignment = _getTitleAlignment(effectiveCenterTitle);
        children.add(Container(
          padding: padding,
          child: Transform(
            alignment: titleAlignment,
            transform: scaleTransform,
            child: Align(
              alignment: titleAlignment,
              child: DefaultTextStyle(
                style: titleStyle,
                child: title,
              ),
            ),
          ),
        ));
      }
    }

    return ClipRect(child: Stack(children: children));
  }
}
