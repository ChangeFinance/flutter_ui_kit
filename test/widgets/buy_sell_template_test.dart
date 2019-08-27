import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/widgets/filled_button.dart';
import 'package:flutter_ui_kit/widgets/layout/buy_sell_template.dart';

import 'wrap_in_material_app.dart';

void main() {
  group('BuySellTemplateTest', () {
    testWidgets('renders the expected layout', (WidgetTester tester) async {
      const mainTitle = 'Buy Bitcoin';
      const subTitle = '\$110 available';

      final action = FilledButton('Buy', onPressed: () {});
      final child = Container();

      await tester.pumpWidget(wrapInMaterialApp(
        BuySellTemplate(
          mainTitle: mainTitle,
          subTitle: subTitle,
          child: child,
          action: action,
        ),
      ));

      expect(find.byType(CloseButton), findsOneWidget);
      expect(find.text(mainTitle), findsOneWidget);
      expect(find.text(subTitle), findsOneWidget);
      expect(find.byType(FilledButton), findsOneWidget);
      expect(find.byKey(const Key('childExpandedContainer')), findsOneWidget);
      expect(find.byKey(const Key('actionPadding')), findsOneWidget);
    });
  });
}
