
import 'package:flutter_ui_kit/stories/badges.dart';
import 'package:flutter_ui_kit/stories/buttons.dart';
import 'package:flutter_ui_kit/stories/cards.dart';
import 'package:flutter_ui_kit/stories/checkboxes.dart';
import 'package:flutter_ui_kit/stories/colors.dart';
import 'package:flutter_ui_kit/stories/graphs.dart';
import 'package:flutter_ui_kit/stories/layouts.dart';
import 'package:flutter_ui_kit/stories/numpads.dart';
import 'package:flutter_ui_kit/stories/popover.dart';
import 'package:flutter_ui_kit/stories/sliders.dart';
import 'package:flutter_ui_kit/stories/typography.dart';
import 'package:flutter_ui_kit/stories/icons.dart';
import 'package:flutter_ui_kit/stories/wizard.dart';
import 'package:flutter_ui_kit/story_book/story_book.dart';
import 'package:flutter_ui_kit/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/widgets/custom_date_picker.dart';
import 'package:flutter_ui_kit/widgets/customradio/custom_radio.dart';
import 'package:flutter_ui_kit/widgets/layout/sliver_template.dart';
import 'package:flutter_ui_kit/widgets/sliver_widgets.dart';
import 'package:flutter_ui_kit/stories/progress_indicators.dart';
import 'package:flutter_ui_kit/stories/password_validators.dart';

void main() {

  runApp(
    MaterialApp(
      theme: theme,
      home: StoryBook(
        title: 'Change UI Components',
        pages: [
          AppColors(),
          AppTypography(),
          Buttons(),
          Badges(),
          NumPads(),
          AppCards(),
          Popover(),
          Layouts(),
          ProgressIndicators(),
          PasswordValidators(),
          Iconography(),
          SliverTemplate(
            content: SliverWidgets().content(),
            sliverList: SliverWidgets().buildSliverList(),
            pinWidget: SliverWidgets().bottomButton()
          ),
          Iconography(),
          Sliders(),
          WizardStory(),
          CustomDatePicker(onChange: (dateTime) {}),
          CustomRadio(radioElements: CustomRadio.availableRadioModels()),
          Checkboxes(),
          Graphs(),
        ],
      ),
    ),
  );
}
