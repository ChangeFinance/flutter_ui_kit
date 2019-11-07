import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/ui/input/checkbox_field.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  group('StreamCheckboxField', () {
    BehaviorSubject<bool> value;
    MaterialApp widget;

    setUp(() {
      value = BehaviorSubject<bool>();
      widget = MaterialApp(
        home: Scaffold(
          body: StreamCheckboxField(
            value: value,
            onChanged: value.add,
            label: const Text('Field'),
          ),
        ),
      );
    });

    tearDown(() {
      value.close();
    });

    testWidgets('renders label', (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      expect(find.text('Field'), findsOneWidget);
    });

    testWidgets('renders checkbox', (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      final checkbox = tester.widget<Checkbox>(find.byType(Checkbox));
      expect(checkbox.value, false);
    });

    testWidgets('on error shows error text', (WidgetTester tester) async {
      const errorText = 'Error';
      await tester.pumpWidget(widget);
      expect(find.text(errorText), findsNothing);
      value.addError(errorText);
      await tester.pumpAndSettle();
      expect(find.text(errorText), findsOneWidget);
    });
  });
}
