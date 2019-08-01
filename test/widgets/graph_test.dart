import 'dart:math' as math;

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/widgets/graph.dart';

import '../wrap_in_material_app.dart';
math.Random random = new math.Random();

void main() {
  group('Graph', () {
    testWidgets('renders graph', (WidgetTester tester) async {
      List<Ohlc> _generateRandomData(int count) {
        final result = <Ohlc>[];
        for (var i = 0; i < count; i++) {
          final value = random.nextDouble() * 10000;
          result.add(Ohlc(value, value, value, value));
        }
        return result;
      }
      final data = _generateRandomData(100);
      await tester.pumpWidget(wrapInMaterialApp(
          Graph(
            data: data,
            labelPrefix: '\$',
            enableMaxMin: true,
            lineColor: AppColor.green,
            enableGradient: false,
      )));
      expect(find.byType(Graph), findsOneWidget);
    });
  });
}
