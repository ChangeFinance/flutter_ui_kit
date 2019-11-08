import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/ui/text/copy_to_clipboard.dart';

import '../test_method_channel.dart';

void main() {
  group('Copy To Clipboard', () {
    testWidgets('renders icon', (tester) async {
      await tester.pumpWidget(const Directionality(
          textDirection: TextDirection.ltr,
          child: const CopyToClipboard(value: '123456')));
      expect(find.byType(Icon), findsOneWidget);
    });

    testWidgets('copies on tap', (tester) async {
      setUpTestMethodChannel('flutter/platform', const JSONMethodCodec());
      await tester.pumpWidget(const MaterialApp(
        home: const Scaffold(body: const CopyToClipboard(value: '123456')),
      ));
      await tester.tap(find.byType(Icon));
      expectMethodCall('Clipboard.setData', arguments: <String, dynamic>{
        'text': '123456',
      });
    });
  });
}
