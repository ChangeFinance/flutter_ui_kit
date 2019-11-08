import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/ui/input/text_field.dart';
import 'package:rxdart/rxdart.dart';
import 'package:mockito/mockito.dart';

class MockVoidFunction extends Mock implements Function {
  void call();
}

void main() {
  group('StreamTextField', () {
    BehaviorSubject<String> value;
    MaterialApp widget;

    setUp(() {
      value = BehaviorSubject<String>();
      widget = MaterialApp(
        home: Scaffold(
          body: StreamTextField(
            value: value,
            onChanged: value.add,
            labelText: 'Field',
          ),
        )
      );
    });

    tearDown(() {
      value.close();
    });

    testWidgets('renders TextField', (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('on TextField onChange adds new value to stream',
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      final textField = tester.widget<TextField>(find.byType(TextField));
      textField.onChanged('a');
      await expectLater(value.take(1), emitsInOrder(<String>['a']));
    });

    testWidgets('on focus triggers onFocus', (WidgetTester tester) async {
      final onFocusMockFunction = MockVoidFunction();
      widget = MaterialApp(
        home: Scaffold(
          body: StreamTextField(
            value: value,
            onChanged: value.add,
            focusNode: FocusNode(),
            labelText: 'Field',
            onFocus: onFocusMockFunction.call,
          )
        )
      );

      await tester.pumpWidget(widget);
      await tester.tap(find.byType(TextField));
      verify(onFocusMockFunction.call());
    });

    testWidgets('on unfocus triggers onBlur', (WidgetTester tester) async {
      final onBlurMockFunction = MockVoidFunction();
      widget = MaterialApp(
        home: Scaffold(
          body: StreamTextField(
            value: value,
            onChanged: value.add,
            focusNode: FocusNode(),
            labelText: 'Field',
            onBlur: onBlurMockFunction,
          ),
        ),
      );

      await tester.pumpWidget(widget);
      final textField = tester.widget<TextField>(find.byType(TextField));
      await tester.tap(find.byType(TextField));
      await tester.pump();
      textField.focusNode.unfocus();
      await tester.pumpAndSettle();
      verify(onBlurMockFunction.call());
    });

    testWidgets('on error shows error text', (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      expect(find.text('Error'), findsNothing);
      value.addError('Error');
      await tester.pumpAndSettle();
      expect(find.text('Error'), findsOneWidget);
    });
  });
}
