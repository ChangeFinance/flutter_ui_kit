import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/widgets/list_items/information_list_item.dart';

import '../../wrap_in_material_app.dart';

void main() {
  group('Information list item', () {
    testWidgets('renders information list item', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(
        const InformationListItem(
          'Link',
          'BADGE',
          icon: const Text('icon'),
          title: 'Title',
          information: 'information',
        ),
      ));

      expect(find.text('Link'), findsOneWidget);
      expect(find.text('Title'), findsOneWidget);
      expect(find.text('information'), findsOneWidget);
      expect(find.text('BADGE'), findsOneWidget);
      expect(find.text('icon'), findsOneWidget);

      final Text link = find.text('Link').evaluate().single.widget;
      expect(link.style.color, AppColor.green);

      final Container badgeContainer = find.byKey(const Key('informationListItemBadge')).evaluate().single.widget;
      final BoxDecoration decoration = badgeContainer.decoration;
      expect(decoration.color, AppColor.green);
    });
  });
}
