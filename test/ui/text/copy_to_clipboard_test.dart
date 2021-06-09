import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/ui/text/copy_to_clipboard.dart';
import 'package:mockito/mockito.dart';

import '../test_method_channel.dart';

class MockVoidFunction extends Mock implements Function {
  void call();
}

void main() {
  group('Copy To Clipboard', () {
    testWidgets('renders icon', (tester) async {
      await tester.pumpWidget(const Directionality(
          textDirection: TextDirection.ltr,
          child: const ChgCopyToClipboard(value: '123456')));
      expect(find.byType(Icon), findsOneWidget);
    });

    testWidgets('copies on tap', (tester) async {
      final onTapCallback = MockVoidFunction();
      setUpTestMethodChannel('flutter/platform', const JSONMethodCodec());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: ChgCopyToClipboard(value: '123456', onTapCallback: onTapCallback.call)),
      ));
      await tester.tap(find.byType(Icon));
      expectMethodCall('Clipboard.setData', arguments: <String, Object>{
        'text': '123456',
      });
      verify(onTapCallback.call());
    });
  });
}
