import 'package:changeapp_common/model/currency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/ui/currency_icon.dart';
import 'package:flutter_ui_kit/ui/svg_icon.dart';

void main() {
  group('Currency Detail', () {
    testWidgets('renders icon', (tester) async {
      await tester.pumpWidget(CurrencyIcon(new Currency('ETH')));
      expect(find.byType(SvgIcon), findsOneWidget);
      expect(find.byWidget(SvgIcons.ether), findsOneWidget);
    });

    testWidgets('throws error if currency code is null', (tester) async {
      expect(
            () async {
          await tester.pumpWidget(CurrencyIcon(new Currency('OTHER')));
        },
        throwsAssertionError,
      );
    });
  });
}
