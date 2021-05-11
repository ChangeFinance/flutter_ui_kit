import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/widgets/badge/category_badge.dart';
import 'package:flutter_ui_kit/widgets/badge/category_badge_list.dart';

import '../wrap_in_material_app.dart';

void main() {
  group('Category Badge List', () {
    testWidgets('renders badge list', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(
          CategoryBadgeList(
              models: [
                CategoryBadge(
                    text: 'Badge Content',
                    tagText: '21',
                    name: 'BADGE_1',
                    selected: false
                ),
                CategoryBadge(
                    text: 'Badge Content 2',
                    tagText: '22',
                    name: 'BADGE_2',
                    selected: true
                ),
              ],
          )
      ));

      expect(find.byType(CategoryBadgeList), findsOneWidget);
      expect(find.byType(CategoryBadge), findsNWidgets(2));
      expect(find.text('Badge Content'), findsOneWidget);
      expect(find.text('21'), findsOneWidget);
      expect(find.text('Badge Content 2'), findsOneWidget);
      expect(find.text('22'), findsOneWidget);
    });
  });
}
