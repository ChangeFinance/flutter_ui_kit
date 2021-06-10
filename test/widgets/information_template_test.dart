import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/widgets/filled_button.dart';
import 'package:flutter_ui_kit/widgets/layout/information_template.dart';

import '../wrap_in_material_app.dart';

void main() {
  group('InformationTemplate', () {
    testWidgets('renders the expected layout', (WidgetTester tester) async {
      const header = 'Header';
      const text = 'Body';
      final pic = SvgPicture.asset(
        'assets/update-app.svg',
        width: 285.0,
        height: 215.0,
      );
      final action = ChgFilledButton(
        'Button',
        onPressed: () async {},
        fullWidth: true,
        narrow: false,
      );

      const backbutton = const BackButton();

      await tester.pumpWidget(wrapInMaterialApp(InformationTemplate(
        header,
        text,
        pic,
        action,
        leadingWidget: backbutton,
      )));

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(BackButton), findsOneWidget);
      expect(find.text(header), findsOneWidget);
      expect(find.text(text), findsOneWidget);
      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.text('Button'), findsOneWidget);
    });
  });
}
