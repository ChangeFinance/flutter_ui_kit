import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/widgets/card.dart';

import '../wrap_in_material_app.dart';

void main() {
  group('AppCard', () {
    const underlyingWidget = Container;

    testWidgets('renders child widget', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(
          const ChgAppCard(
            child: const Text('Text Content')
          )
        )
      );

      expect(find.text('Text Content'), findsOneWidget);
    });

    testWidgets('sets correct default properties', (WidgetTester tester) async {
      const child = Text('Text Content');
      await tester.pumpWidget(wrapInMaterialApp(
          const ChgAppCard(
              child: child
          )
        )
      );

      final widget = tester.widget(find.byType(underlyingWidget));
      final containerWidget = widget as Container;
      expect(containerWidget.margin, EdgeInsets.zero);
      expect(containerWidget.child, child);

      final decoration = containerWidget.decoration as BoxDecoration;
      expect(decoration.color, AppColor.deepWhite);
      expect(decoration.borderRadius, const BorderRadius.all(Radius.circular(4)));
      expect(decoration.boxShadow, [const BoxShadow(
          color: AppColor.shadowColor,
          offset: const Offset(0.0, 3.0),
          blurRadius: 5.0,
          spreadRadius: 0.0
      )]);
    });

    testWidgets('passes correct properties', (WidgetTester tester) async {
      const child = Text('Text Content');
      await tester.pumpWidget(wrapInMaterialApp(
          const ChgAppCard(
              child: child,
              elevation: 3,
              margin: EdgeInsets.all(11.0),
              borderRadius: 1,
          )
      )
      );

      final widget = tester.widget(find.byType(underlyingWidget));
      final containerWidget = widget as Container;
      expect(containerWidget.margin, const EdgeInsets.all(11.0));
      expect(containerWidget.child, child);

      final decoration = containerWidget.decoration as BoxDecoration;
      expect(decoration.color, AppColor.deepWhite);
      expect(decoration.borderRadius, const BorderRadius.all(Radius.circular(1)));
      expect(decoration.boxShadow, [const BoxShadow(
          color: AppColor.shadowColor,
          offset: const Offset(0.0, 5.0),
          blurRadius: 15.0,
          spreadRadius: 0.0
      )]);
    });
  });
}
