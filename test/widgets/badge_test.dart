import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/widgets/badge/badge.dart';
import 'package:flutter_ui_kit/widgets/badge/multivalue_badge.dart';

import '../wrap_in_material_app.dart';

void main() {
  group('Badge', () {
    testWidgets('renders simple badge widget', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(
          const Badge(
              'Badge Content',
              minWidth: 80.0,
              textStyle: const TextStyle(color: AppColor.red, fontSize: 16.0),
              bgColor: AppColor.green
          )
      )
      );

      expect(find.text('Badge Content'), findsOneWidget);
      final widget = tester.widget(find.byType(Container));
      final Container containerWidget = widget;
      final BoxDecoration decoration = containerWidget.decoration;
      expect(decoration.color, AppColor.green);
      expect(
          decoration.borderRadius, const BorderRadius.all(Radius.circular(15)));

      final constrains = containerWidget.constraints;
      expect(constrains.minWidth, 80.0);
    });
  });

  testWidgets('renders multivalue badge widget', (WidgetTester tester) async {
    await tester.pumpWidget(wrapInMaterialApp(
         MultiValueBadge(
            const ['Badge Content1', 'Badge Content2'],
            minWidth: 80.0,
            textStyle: const TextStyle(color: AppColor.red, fontSize: 16.0),
            bgColor: AppColor.green
        )
    )
    );

    expect(find.text('Badge Content1'), findsOneWidget);
    final widget = tester.widget(find.byType(Container));
    final Container containerWidget = widget;
    final BoxDecoration decoration = containerWidget.decoration;
    expect(decoration.color, AppColor.green);
    expect(
        decoration.borderRadius, const BorderRadius.all(Radius.circular(15)));

    final constrains = containerWidget.constraints;
    expect(constrains.minWidth, 80.0);

    await tester.tap(find.text('Badge Content1'));
    await tester.pump();
    expect(find.text('Badge Content2'), findsOneWidget);
  });
}
