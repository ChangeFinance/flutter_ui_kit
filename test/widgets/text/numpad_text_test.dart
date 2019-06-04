import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/widgets/text/numpad_text.dart';
import '../../wrap_in_material_app.dart';

void main() {
  group('NumPadText create test', () {
    final _textEditingController = TextEditingController();

    testWidgets('renders numpad widget', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(
          NumPadText(textEditingController: _textEditingController)));
      expect(find.widgetWithIcon(NumPadText, Icons.arrow_back), findsOneWidget);
    });
  });

  group('NumPadText input', () {
    final _textEditingController = TextEditingController();

    testWidgets('on tap key tests', (WidgetTester tester) async {
      await tester
          .pumpWidget(wrapInMaterialApp(NumPadText(textEditingController: _textEditingController, decimalPlaces: 6)));
      await tester.tap(find.text('1'));
      await tester.tap(find.text('2'));
      await tester.tap(find.text('3'));
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.tap(find.text('2'));
      await tester.tap(find.text('3'));
      await tester.tap(find.text('.'));
      await tester.tap(find.text('.'));
      await tester.tap(find.text('1'));
      await tester.tap(find.text('2'));
      await tester.tap(find.text('3'));
      await tester.tap(find.text('.'));
      await tester.tap(find.text('4'));
      await tester.tap(find.text('5'));
      await tester.tap(find.text('6'));
      await tester.tap(find.text('7'));
      await tester.tap(find.text('8'));
      await tester.pump();
      expect(_textEditingController.text, '123.123456');
    });
  });
}
