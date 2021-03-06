import 'package:flutter_ui_kit/stories/animations.dart';
import 'package:flutter_ui_kit/stories/badges.dart';

import 'package:flutter_ui_kit/stories/custom_label_value.dart';
import 'package:flutter_ui_kit/stories/buttons.dart';
import 'package:flutter_ui_kit/stories/cards.dart';
import 'package:flutter_ui_kit/stories/checkboxes.dart';
import 'package:flutter_ui_kit/stories/colors.dart';
import 'package:flutter_ui_kit/stories/currency_displays.dart';
import 'package:flutter_ui_kit/stories/indicators.dart';
import 'package:flutter_ui_kit/stories/info_box.dart';
import 'package:flutter_ui_kit/stories/inputs.dart';
import 'package:flutter_ui_kit/stories/label_value_pairs.dart';
import 'package:flutter_ui_kit/stories/layouts.dart';
import 'package:flutter_ui_kit/stories/listItems.dart';
import 'package:flutter_ui_kit/stories/loader.dart';
import 'package:flutter_ui_kit/stories/new_typography.dart' as new_typography;
import 'package:flutter_ui_kit/stories/numpads.dart';
import 'package:flutter_ui_kit/stories/odometers.dart';
import 'package:flutter_ui_kit/stories/pin_views.dart';
import 'package:flutter_ui_kit/stories/popover.dart';
import 'package:flutter_ui_kit/stories/sliders.dart';
import 'package:flutter_ui_kit/stories/timelines.dart';
import 'package:flutter_ui_kit/stories/top_movers_cards.dart';
import 'package:flutter_ui_kit/stories/typography.dart';
import 'package:flutter_ui_kit/stories/icons.dart';
import 'package:flutter_ui_kit/stories/wizard.dart';
import 'package:flutter_ui_kit/story_book/story_book.dart';
import 'package:flutter_ui_kit/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/widgets.dart';
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
          Animations(),
          AppColors(),
          new_typography.Typography(),
          AppTypography(),
          Odometers(),
          Inputs(),
          Buttons(),
          Badges(),
          ListItems(),
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
              pinWidget: SliverWidgets().bottomButton()),
          Iconography(),
          Sliders(),
          WizardStory(),
          CustomDatePicker(onChange: (dateTime) {}),
          CustomRadio(radioElements: CustomRadio.availableRadioModels()),
          Checkboxes(),
          CustomLabelValue(),
          CurrencyDisplays(),
          InfoBoxes(),
          Indicators(),
          PinViews(),
          Loaders(),
          TopMoversCards(),
          LabelValuePairs(),
          Timelines(),
        ],
      ),
    ),
  );
}
