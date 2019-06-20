import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/widgets/slider/layout/utility_slide.dart';

import '../wrap_in_material_app.dart';

void main() {
  testWidgets('renders the expected layout', (WidgetTester tester) async {
    const header = 'Pre-order your card';
    const text =
        'Convert instantly between your currencies and spend with your card world wide';
    final pic = SvgPicture.asset(
      'assets/card_holder.svg',
      width: 285.0,
      height: 215.0,
    );
    await tester.pumpWidget(wrapInMaterialApp(UtilitySlide(header, text, pic)));

    expect(find.text(header), findsOneWidget);
    expect(find.text(text), findsOneWidget);
    expect(find.byType(SvgPicture), findsOneWidget);
    expect(find.text('Pre-order your card'), findsOneWidget);
  });
}
