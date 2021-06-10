import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit/widgets/change_app_icons.dart';
import 'package:flutter_ui_kit/widgets/custom_checkbox.dart';
import 'package:mocktail/mocktail.dart';

import '../wrap_in_material_app.dart';

class OnCheckboxChangedMock extends Mock implements Function {
  // ignore: avoid_positional_boolean_parameters
  void call(bool value);
}

void main() {

  group('Checkboxes', () {
    testWidgets('renders simple checkbox widget', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(
          CustomCheckbox(
              isChecked: true,
              label: const Text('Sample Checkbox'),
              errorText: 'Error message',
              onChanged: (checked){},
          )
      )
      );

      expect(find.text('Sample Checkbox'), findsOneWidget);
      expect(find.text('Error message'), findsOneWidget);
      expect(find.byWidget(ChangeAppIcons.checkbox_checked), findsOneWidget);
    });
  });

  testWidgets('calls onChanged with new value', (WidgetTester tester) async {

    final onCheckboxChanged = OnCheckboxChangedMock().call;

    await tester.pumpWidget(wrapInMaterialApp(
        CustomCheckbox(
          isChecked: true,
          label: const Text('Sample Checkbox'),
          errorText: 'Error message',
          onChanged: onCheckboxChanged,
        ))
    );

    await tester.tap(find.text('Sample Checkbox'));
    await tester.pump();
    verify(() => onCheckboxChanged(false)).called(1);
  });
}
