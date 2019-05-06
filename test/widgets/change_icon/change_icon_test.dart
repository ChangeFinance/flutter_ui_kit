import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/widgets/change_icon/change_icon.dart';
import 'package:flutter_ui_kit/widgets/change_icon/change_icon_data.dart';
import 'package:flutter_ui_kit/widgets/change_icon/change_icon_type.dart';
import '../../wrap_in_material_app.dart';

void main() {
  group('svg', () {
    testWidgets('renders widget', (WidgetTester tester) async {
      const icon = const ChangeIcon(
        ChangeIconData('wallet', ChangeIconType.enabled)
      );
      await tester.pumpWidget(wrapInMaterialApp(icon));
      expect(find.byWidget(icon), findsOneWidget);
    });
  });
}