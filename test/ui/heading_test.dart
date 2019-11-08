import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/ui/text/heading.dart';

void main() {
  testWidgets('Heading shows text', (tester) async {
    await tester.pumpWidget(const Directionality(
        textDirection: TextDirection.ltr, child: const Heading('Test')));
    expect(find.text('Test'), findsOneWidget);
  });
}
