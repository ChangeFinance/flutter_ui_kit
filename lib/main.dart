import 'package:flutter_ui_kit/stories/buttons.dart';
import 'package:flutter_ui_kit/stories/cards.dart';
import 'package:flutter_ui_kit/stories/colors.dart';
import 'package:flutter_ui_kit/stories/layouts.dart';
import 'package:flutter_ui_kit/stories/popover.dart';
import 'package:flutter_ui_kit/stories/typography.dart';
import 'package:flutter_ui_kit/stories/icons.dart';
import 'package:flutter_ui_kit/story_book/story_book.dart';
import 'package:flutter_ui_kit/theme.dart';
import 'package:flutter/material.dart';

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
          AppCards(),
          Popover(),
          Layouts(),
          IconsStory()
        ],
      ),
    ),
  );
}
