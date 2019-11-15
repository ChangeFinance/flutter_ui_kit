import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/widgets/text/passcode_numpad_text.dart';

import '../../wrap_in_material_app.dart';

void main() {

  group('NumPadText create test', () {
    final _textEditingController = TextEditingController();
    void onChangeTextField(String value) {
      _textEditingController.text = value;
    }

    testWidgets('renders numpad widget', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(
          PasscodeNumPadText(onChange: onChangeTextField)));
      expect(find.widgetWithIcon(PasscodeNumPadText, Icons.arrow_back), findsOneWidget);
    });
  });

  group('NumPadText input', () {
    final _textEditingController = TextEditingController();
    void onChange(String value) {
      _textEditingController.text = value;
    }

    testWidgets('on tap key tests', (WidgetTester tester) async {
      final testNumPad = PasscodeNumPadText(onChange: onChange,textLengthLimit: 4);
      await tester.pumpWidget(wrapInMaterialApp(testNumPad));
      await tester.tap(find.text('1'));
      await tester.tap(find.text('2'));
      await tester.tap(find.text('3'));
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.tap(find.text('2'));
      await tester.tap(find.text('3'));
      await tester.tap(find.text('1'));
      await tester.tap(find.text('2'));
      await tester.tap(find.text('3'));
      await tester.pump();
      expect(_textEditingController.text, '1231');
    });
  });
}
