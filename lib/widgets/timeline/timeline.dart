import 'package:flutter/material.dart';

class TimelineModel {
  final Widget widget;
  final bool isActive;

  TimelineModel({@required this.widget, @required this.isActive});
}

class Timeline extends StatelessWidget {
  const Timeline({
    @required this.children,
    this.indicators,
    this.isLeftAligned = true,
    this.itemGap = 12.0,
    this.gutterSpacing = 4.0,
    this.padding = const EdgeInsets.all(8),
    this.controller,
    this.lineColor = Colors.grey,
    this.activeLineColor = Colors.grey,
    this.physics,
    this.shrinkWrap = true,
    this.primary = false,
    this.reverse = false,
    this.indicatorSize = 30.0,
    this.lineGap = 0.0,
    this.indicatorColor = Colors.blue,
    this.indicatorStyle = PaintingStyle.fill,
    this.strokeCap = StrokeCap.butt,
    this.strokeWidth = 3.0,
    this.style = PaintingStyle.stroke,
  })  : itemCount = children.length,
        assert(itemGap >= 0),
        assert(lineGap >= 0),
        assert(indicators == null || children.length == indicators.length);

  final List<TimelineModel> children;
  final double itemGap;
  final double gutterSpacing;
  final List<Widget> indicators;
  final bool isLeftAligned;
  final EdgeInsets padding;
  final ScrollController controller;
  final int itemCount;
  final ScrollPhysics physics;
  final bool shrinkWrap;
  final bool primary;
  final bool reverse;

  final Color lineColor;
  final Color activeLineColor;
  final double lineGap;
  final double indicatorSize;
  final Color indicatorColor;
  final PaintingStyle indicatorStyle;
  final StrokeCap strokeCap;
  final double strokeWidth;
  final PaintingStyle style;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      separatorBuilder: (_, __) => SizedBox(height: itemGap),
      physics: physics,
      shrinkWrap: shrinkWrap,
      itemCount: itemCount,
      controller: controller,
      reverse: reverse,
      primary: primary,
      itemBuilder: (context, index) {
        final child = children[index];
        final prevChild = index == 0 ? null : children[index - 1];

        Widget indicator;
        if (indicators != null) {
          indicator = indicators[index];
        }

        final isFirst = index == 0;
        final isLast = index == itemCount - 1;

        final timelineTile = <Widget>[
          CustomPaint(
            foregroundPainter: _TimelinePainter(
              hideDefaultIndicator: indicator != null,
              lineColor: lineColor,
              activeLineColor: activeLineColor,
              isActive: child.isActive,
              isPrevActive: prevChild?.isActive ?? false,
              indicatorColor: indicatorColor,
              indicatorSize: indicatorSize,
              indicatorStyle: indicatorStyle,
              isFirst: isFirst,
              isLast: isLast,
              lineGap: lineGap,
              strokeCap: strokeCap,
              strokeWidth: strokeWidth,
              style: style,
              itemGap: itemGap,
            ),
            child: SizedBox(
              height: double.infinity,
              width: indicatorSize,
              child: indicator,
            ),
          ),
          SizedBox(width: gutterSpacing),
          Expanded(child: child.widget),
        ];

        return IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: isLeftAligned ? timelineTile : timelineTile.reversed.toList(),
          ),
        );
      },
    );
  }
}

class _TimelinePainter extends CustomPainter {
  _TimelinePainter({
    @required this.hideDefaultIndicator,
    @required this.indicatorColor,
    @required this.indicatorStyle,
    @required this.indicatorSize,
    @required this.lineGap,
    @required this.strokeCap,
    @required this.strokeWidth,
    @required this.style,
    @required this.lineColor,
    @required this.activeLineColor,
    @required this.isFirst,
    @required this.isLast,
    @required this.itemGap,
    this.isActive = false,
    this.isPrevActive = false,
  })  : linePaint = Paint()
          ..color = lineColor
          ..strokeCap = strokeCap
          ..strokeWidth = strokeWidth
          ..style = style,
        circlePaint = Paint()
          ..color = indicatorColor
          ..style = indicatorStyle;

  final bool hideDefaultIndicator;
  final Color indicatorColor;
  final PaintingStyle indicatorStyle;
  final double indicatorSize;
  final double lineGap;
  final StrokeCap strokeCap;
  final double strokeWidth;
  final PaintingStyle style;
  final Color lineColor;
  final Color activeLineColor;
  final Paint linePaint;
  final Paint circlePaint;
  final bool isFirst;
  final bool isLast;
  final bool isActive;
  final bool isPrevActive;
  final double itemGap;

  @override
  void paint(Canvas canvas, Size size) {
    final indicatorRadius = indicatorSize / 2;
    final halfItemGap = itemGap / 2;
    final indicatorMargin = indicatorRadius + lineGap;

    final top = size.topLeft(Offset(indicatorRadius, 0.0 - halfItemGap));
    final centerTop = size.centerLeft(
      Offset(indicatorRadius, -indicatorMargin),
    );

    final bottom = size.bottomLeft(Offset(indicatorRadius, 0.0 + halfItemGap));
    final centerBottom = size.centerLeft(
      Offset(indicatorRadius, indicatorMargin),
    );

    if (!isFirst) {
      if (isPrevActive) {
        linePaint.color = activeLineColor;
      }
      canvas.drawLine(top, centerTop, linePaint);
      linePaint.color = lineColor;
    }

    if (!isLast) {
      if (isActive) {
        linePaint.color = activeLineColor;
      }
      canvas.drawLine(centerBottom, bottom, linePaint);
      linePaint.color = lineColor;
    }

    if (!hideDefaultIndicator) {
      final offsetCenter = size.centerLeft(Offset(indicatorRadius, 0));
      canvas.drawCircle(offsetCenter, indicatorRadius, circlePaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
