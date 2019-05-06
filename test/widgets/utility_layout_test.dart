import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/widgets/filled_button.dart';
import 'package:flutter_ui_kit/widgets/layout/utility_template.dart';

import '../wrap_in_material_app.dart';

void main() {
  group('UtilityTemplate', () {
    testWidgets('renders the expected layout', (WidgetTester tester) async {
      const header = 'Update your app';
      const text =
          'Get the latest version of Change to make sure you have access to the latest features and updates.';
      final pic = SvgPicture.asset(
        'assets/update-app.svg',
        width: 285.0,
        height: 215.0,
      );
      final action = FilledButton(
        'Update app',
        onPressed: () {},
        fullWidth: true,
        narrow: false,
      );
      await tester.pumpWidget(wrapInMaterialApp(UtilityTemplate(header, text, pic, action)));

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text(header), findsOneWidget);
      expect(find.text(text), findsOneWidget);
      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.text('Update app'), findsOneWidget);
    });
  });
}
