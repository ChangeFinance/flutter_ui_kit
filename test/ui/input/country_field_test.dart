import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/ui/input/country_field.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  group('Country Text Field', () {
    BehaviorSubject<String>? value;
    late MaterialApp widget;

    setUp(() {
      value = BehaviorSubject<String>();
      widget = MaterialApp(
        home: Scaffold(
          body: ChgStreamCountryTextField(
            value: value,
            onChanged: value!.add as void Function(dynamic)?,
            labelText: 'Field',
          ),
        ),
      );
    });

    tearDown(() {
      value!.close();
    });

    testWidgets('chooses country', (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      await tester.tap(find.byType(ChgStreamCountryTextField));
      await tester.pump();
      await tester.tap(find.text('Afghanistan'));
      await tester.pumpAndSettle();
      value!.listen(expectAsync1((country) {
        expect(country, 'Afghanistan');
      }));
    });

    testWidgets('shows EU countries if onlyEUCountries is true',
        (WidgetTester tester) async {
      widget = MaterialApp(
        home: Scaffold(
          body: ChgStreamCountryTextField(
            value: value,
            onChanged: value!.add as void Function(dynamic)?,
            labelText: 'Field',
            onlyEEACountries: true,
          ),
        ),
      );
      await tester.pumpWidget(widget);
      await tester.tap(find.byType(ChgStreamCountryTextField));
      await tester.pump();
      expect(find.text('Afghanistan'), findsNothing);
      await tester.tap(find.text('Austria'));
      await tester.pumpAndSettle();
      value!.listen(expectAsync1((country) {
        expect(country, 'Austria');
      }));
    });

    testWidgets('hides strict jurisdiction countries',
        (WidgetTester tester) async {
      widget = MaterialApp(
        home: Scaffold(
          body: ChgStreamCountryTextField(
            value: value,
            onChanged: value!.add as void Function(dynamic)?,
            labelText: 'Field',
            hideStrictJurisdictionCountries: true,
          ),
        ),
      );
      await tester.pumpWidget(widget);
      await tester.tap(find.byType(ChgStreamCountryTextField));
      await tester.pump();
      expect(find.text('United States'), findsNothing);
    });
  });
}
