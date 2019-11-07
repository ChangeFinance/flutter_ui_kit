import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/ui/paper.dart';

void main() {
  group('Paper', () {
    testWidgets('renders children', (tester) async {
      await tester.pumpWidget(const Directionality(
        textDirection: TextDirection.ltr,
        child: Paper(
          children: [
            Text('child 1'),
            Text('child 2'),
          ],
        ),
      ));
      expect(find.byType(Text), findsNWidgets(2));
    });

    testWidgets('responds to onTap', (tester) async {
      var counter = 0;
      await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: new Paper(
          children: const [],
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
