import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/ui/text/subhead.dart';

void main() {
  testWidgets('Subhead shows text', (tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: const Subhead('Test'),
      ),
    );
    expect(find.text('Test'), findsOneWidget);
  });
}
