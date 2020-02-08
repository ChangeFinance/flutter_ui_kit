import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/widgets/news/news_card.dart';

import '../../wrap_in_material_app.dart';

void main() {
  group('News card create test', () {
    testWidgets('renders news card widget', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(
          const NewsCard(title: 'Change is an unicorn!', source: 'Change')));
      expect(find.byType(NewsCard), findsOneWidget);
      expect(find.text('Change'), findsOneWidget);
      expect(find.text('Change is an unicorn!'), findsOneWidget);
    });
  });
}
