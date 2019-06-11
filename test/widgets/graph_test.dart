import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/widgets/graph.dart';

import '../wrap_in_material_app.dart';
math.Random random = new math.Random();

void main() {
  group('Graph', () {
    testWidgets('renders graph', (WidgetTester tester) async {
      List<double> _generateRandomData(int count) {
        final result = <double>[];
        for (var i = 0; i < count; i++) {
          result.add(random.nextDouble() * 10000);
        }
        return result;
      }
      final data = _generateRandomData(100);
      final key = ValueKey(data);
      await tester.pumpWidget(wrapInMaterialApp(
          Graph(
            key: key,
            data: data,
            labelPrefix: '\$',
            enableMaxMin: true
      )));
      expect(find.byKey(key), findsOneWidget);
    });
  });
}
