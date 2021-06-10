import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/text.dart';
import 'package:flutter_ui_kit/widgets/filled_button.dart';
import 'package:flutter_ui_kit/widgets/layout/utility_generic_template.dart';

import '../wrap_in_material_app.dart';

void main() {
  group('UtilityGenericTemplate with body as a widget', () {
    testWidgets('renders the expected layout', (WidgetTester tester) async {
      const header = 'Update your app';
      const text =
          'Get the latest version of Change.';
      final pic = SvgPicture.asset(
        'assets/update-app.svg',
        width: 285.0,
        height: 215.0,
      );
      final action = ChgFilledButton(
        'Update app',
        onPressed: () async {},
        fullWidth: true,
        narrow: false,
      );

      final body = Column(
        children: <Widget>[
          Text(text,
              textAlign: TextAlign.center,
              style:
              AppText.body1.copyWith(color: AppColor.semiGrey)),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'If you have any questions, please contact ',
              style: AppText.body1
                  .copyWith(color: AppColor.semiGrey),
              children: [
                new TextSpan(
                    text: 'support@getchange.com',
                    style:
                    const TextStyle(color: AppColor.green),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () {}),],),
          )
        ],
      );

      await tester.pumpWidget(wrapInMaterialApp(
          UtilityGenericTemplate(
            header, body, pic, action
          ))
      );

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text(header), findsOneWidget);
      expect(find.text(text), findsOneWidget);
      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.text('Update app'), findsOneWidget);
      const expectedText =
          'If you have any questions, please contact support@getchange.com';
      final widgetFinder = find.byType(RichText);
      // ignore: avoid_as
      final richText = widgetFinder.evaluate().elementAt(2).widget as RichText;
      final richTextText = richText.text.toPlainText();
      expect(richTextText, expectedText);
    });
  });
}
