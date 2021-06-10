import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/widgets/slider/dots_indicator.dart';
import 'package:mocktail/mocktail.dart';

import '../wrap_in_material_app.dart';

class MockPageController extends Mock implements PageController {}

class OnPageSelectedMock extends Mock implements Function {
  void call(int index);
}

void main() {
  int? dotsCount;
  late PageController pageController;

  setUp(() {
    dotsCount = 4;
    pageController = MockPageController();
    when(() => pageController.page).thenReturn(0);
  });

  testWidgets('renders dots', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapInMaterialApp(
        DotsIndicator(itemCount: dotsCount, controller: pageController),
      ),
    );

    expect(find.byType(Dot), findsNWidgets(dotsCount!));
  });

  testWidgets('calls onPageSelected callback when dot is tapped',
      (WidgetTester tester) async {
    final onPageSelected = OnPageSelectedMock().call;
    await tester.pumpWidget(
      wrapInMaterialApp(
        DotsIndicator(
          itemCount: dotsCount,
          controller: pageController,
          onPageSelected: onPageSelected,
        ),
      ),
    );

    await tester.tap(find.byType(Dot).last);

    verify(() => onPageSelected(dotsCount! - 1)).called(1);
  });

  testWidgets('uses pageController to determine which dot to highlight',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapInMaterialApp(
        DotsIndicator(itemCount: dotsCount, controller: pageController),
      ),
    );

    final firstDot = tester.widget<Dot>(find.byType(Dot).first);

    expect(firstDot.color, AppColor.darkerGreen);
  });
}
