import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/widgets/top_movers/top_movers_card.dart';

void main() {
  group('Top movers card', () {

    testWidgets('renders child widget', (WidgetTester tester) async {
      await tester.pumpWidget(const Directionality(
          textDirection: TextDirection.ltr,
          child: TopMoversCard(
              currencyName: 'Bitcoin',
              currencyCode: 'BTC',
              percentage: '600.1%',
              isGrowing: true
          )
      ));
      expect(find.byType(Text), findsNWidgets(3));
    });

    testWidgets('responds to onTap', (tester) async {
      var counter = 0;
      await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: TopMoversCard(
          currencyName: 'Bitcoin',
          currencyCode: 'BTC',
          percentage: '600.1%',
          isGrowing: true,
          onTap: () {
            counter++;
          },
        ),
      ));
      expect(find.byType(GestureDetector), findsOneWidget);
      await tester.tap(find.byType(GestureDetector));
      await tester.pump();
      expect(counter, 1);
    });
  });
}