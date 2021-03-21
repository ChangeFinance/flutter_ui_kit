import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/ui/progress/progress_bar.dart';

void main() {
  group('Progress Bar', () {
    testWidgets('renders full width if progress is 1.0', (tester) async {
      final key = UniqueKey();
      await tester.pumpWidget(MediaQuery(
        data: const MediaQueryData(size: Size.square(15.0)),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: ChgProgressBar(
            progress: 1.0,
            progressKey: key,
          ),
        ),
      ));

      final size = tester.getSize(find.byKey(key));
      expect(size.height, 4.0);
      expect(size.width, 10.0);
    });

    testWidgets('renders 0 width if progress is 0', (tester) async {
      final key = UniqueKey();
      await tester.pumpWidget(MediaQuery(
        data: const MediaQueryData(size: Size.square(15.0)),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: ChgProgressBar(
            progress: 0.0,
            progressKey: key,
          ),
        ),
      ));

      final size = tester.getSize(find.byKey(key));
      expect(size.height, 4.0);
      expect(size.width, 0.0);
    });
  });
}
