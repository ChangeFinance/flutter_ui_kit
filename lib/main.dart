import 'package:flutter_ui_kit/stories/buttons.dart';
import 'package:flutter_ui_kit/stories/cards.dart';
import 'package:flutter_ui_kit/stories/colors.dart';
import 'package:flutter_ui_kit/stories/layouts.dart';
import 'package:flutter_ui_kit/stories/numpads.dart';
import 'package:flutter_ui_kit/stories/popover.dart';
import 'package:flutter_ui_kit/stories/typography.dart';
import 'package:flutter_ui_kit/stories/icons.dart';
import 'package:flutter_ui_kit/story_book/story_book.dart';
import 'package:flutter_ui_kit/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/widgets/layout/sliver_template.dart';
import 'package:flutter_ui_kit/widgets/sliver_widgets.dart';

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
          NumPads(),
          AppCards(),
          Popover(),
          Layouts(),
          Iconography(),
          SliverTemplate(
            content: SliverWidgets().content(),
            sliverList: SliverWidgets().buildSliverList(),
            pinWidget: SliverWidgets().bottomButton()
          )
        ],
      ),
    ),
  );
}
