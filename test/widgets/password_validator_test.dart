import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/widgets/password_validator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/widgets/simple_progress_indicator.dart';
import '../wrap_in_material_app.dart';

void main() {

  group('PasswordValidator', () {

    testWidgets('renders password validator bar on the screen', (WidgetTester tester) async{
      await tester.pumpWidget(wrapInMaterialApp(
        const PasswordValidator()
      ));
      expect(find.byType(PasswordValidator), findsOneWidget);
    });

    testWidgets('sets correct default properties', (WidgetTester tester) async{
      await tester.pumpWidget(wrapInMaterialApp(
        const PasswordValidator()
      ));
      final SimpleProgressIndicator progressIndicator = tester.element(find.byType(SimpleProgressIndicator)).widget;
      final PasswordValidator passwordValidator = tester.element(find.byType(PasswordValidator)).widget;
      final hintList = ['Try making it longer then 8 digits and adding capital characters that makes it difficult for others to guess.',
      'That is a good password, but you can try to add digits and special characters to make it a great one!',
      'You can enable two-factor authentication later.',
      'Make it longer than 8 characters.'];
      final strengthList = ['bad', 'weak', 'normal', 'good', 'great', 'bad'];
      final colorList = [Colors.redAccent, Colors.orangeAccent, Colors.blueAccent, Colors.lightGreen, Colors.greenAccent];

      expect(passwordValidator.password, 'Password123*');
      expect(passwordValidator.hintList, hintList);
      expect(passwordValidator.strengthList, strengthList);
      expect(passwordValidator.colorList, colorList);
      expect(progressIndicator.percentageFilled, 100.0);
      expect(progressIndicator.background, true);
      expect(progressIndicator.height, 5.0);
      expect(progressIndicator.roundedBorder, 10.0);
      expect(progressIndicator.color, Colors.greenAccent);
    });

    testWidgets('passes correct non default properties', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(
        const PasswordValidator(
          password: 'badpass',
          hintList: ['testHint1', 'testHint2', 'testHint3'],
          strengthList: ['testStrength1', 'testStrength2', 'testStrength3', 'testStrength4', 'testStrength5'],
          colorList: [Colors.black, Colors.grey, Colors.yellow, Colors.lime, Colors.indigo],
        )
      ));

      final PasswordValidator passwordValidator = tester.element(find.byType(PasswordValidator)).widget;
      final SimpleProgressIndicator progressIndicator = tester.element(find.byType(SimpleProgressIndicator)).widget;
      final hintList = ['testHint1', 'testHint2', 'testHint3'];
      final strengthList = ['testStrength1', 'testStrength2', 'testStrength3', 'testStrength4', 'testStrength5'];
      final colorList = [Colors.black, Colors.grey, Colors.yellow, Colors.lime, Colors.indigo];
      expect(passwordValidator.password, 'badpass');
      expect(passwordValidator.hintList, hintList);
      expect(passwordValidator.strengthList, strengthList);
      expect(passwordValidator.colorList, colorList);
      expect(progressIndicator.percentageFilled, 20.0);
      expect(progressIndicator.background, true);
      expect(progressIndicator.height, 5.0);
      expect(progressIndicator.roundedBorder, 10.0);
      expect(progressIndicator.color, Colors.black);
    });

  });
}