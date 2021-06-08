import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/widgets/badge/category_badge.dart';

import '../wrap_in_material_app.dart';

void main() {
  group('Category Badge', () {
    testWidgets('renders default category badge widget', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(
          CategoryBadge(
              text: 'Badge Content',
              tagText: '21',
              name: 'BADGE',
              selected: false
          )
      ));

      expect(find.byType(CategoryBadge), findsOneWidget);
      expect(find.text('Badge Content'), findsOneWidget);
      expect(find.text('21'), findsOneWidget);
      final widget = tester.widget(find.byKey(const Key('BADGE_container')));
      final Container containerWidget = widget as Container;
      final BoxDecoration decoration = containerWidget.decoration as BoxDecoration;
      expect(decoration.color, AppColor.deepWhite);
      expect(decoration.borderRadius, const BorderRadius.all(Radius.circular(18)));
      expect(decoration.border, const Border.fromBorderSide(BorderSide(color: AppColor.semiGrey)));
    });

    testWidgets('renders selected category badge widget', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(
          CategoryBadge(
              text: 'Badge Content',
              tagText: '21',
              name: 'BADGE',
              selected: true
          )
      ));

      expect(find.byType(CategoryBadge), findsOneWidget);
      expect(find.text('Badge Content'), findsOneWidget);
      expect(find.text('21'), findsOneWidget);
      final widget = tester.widget(find.byKey(const Key('BADGE_container')));
      final Container containerWidget = widget as Container;
      final BoxDecoration decoration = containerWidget.decoration as BoxDecoration;
      expect(decoration.color, AppColor.green);
      expect(decoration.borderRadius, const BorderRadius.all(Radius.circular(18)));
      expect(decoration.border, const Border.fromBorderSide(BorderSide(color: AppColor.deepWhite)));
    });
  });
}
