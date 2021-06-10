import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/widgets/list_items/information_list_item.dart';

import '../../wrap_in_material_app.dart';

void main() {
  var linkPressed = false;
  // ignore: prefer_function_declarations_over_variables
  final linkAction = () {
    linkPressed = true;
  };

  group('Information list item', () {
    testWidgets('renders information list item', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(
        InformationListItem(
          'Link',
          'BADGE',
          icon: const Text('icon'),
          title: 'Title',
          information: 'information',
          linkAction: linkAction,
        ),
      ));

      expect(find.text('Link'), findsOneWidget);
      expect(find.text('Title'), findsOneWidget);
      expect(find.text('information'), findsOneWidget);
      expect(find.text('BADGE'), findsOneWidget);
      expect(find.text('icon'), findsOneWidget);

      final link = find.text('Link').evaluate().single.widget as Text;
      expect(link.style!.color, AppColor.green);

      final badgeContainer = find.byKey(const Key('informationListItemBadge')).evaluate().single.widget as Container;
      final decoration = badgeContainer.decoration as BoxDecoration;
      expect(decoration.color, AppColor.green);
    });

    testWidgets('link action calls link action callbacl', (WidgetTester tester)async {
      await tester.pumpWidget(wrapInMaterialApp(
        InformationListItem(
          'Link',
          'BADGE',
          icon: const Text('icon'),
          title: 'Title',
          information: 'information',
          linkAction: linkAction,
        ),
      ));

      await tester.tap(find.text('Link'));
      expect(linkPressed, true);
    });
  });
}
