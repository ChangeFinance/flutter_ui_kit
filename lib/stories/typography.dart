import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/story_book/story.dart';
import 'package:flutter_ui_kit/widgets/text/heading.dart';
import 'package:flutter_ui_kit/widgets/text/heading_type.dart';
import 'package:flutter_ui_kit/widgets/text/text_pair.dart';

class AppTypography extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_headers(), _bodies(context), _textComponents()],
        ),
      ),
    );
  }

  Widget _headers() {
    return Story(
      title: 'Headers',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Heading('Heading 0   -  Bold; 40pt',
                headingType: HeadingType.HEADING_0),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Heading('Heading 1 - Bold; 30pt',
                headingType: HeadingType.HEADING_1),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Heading('Heading 2 - Bold; 24pt',
                headingType: HeadingType.HEADING_2),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Heading('Heading 3 - Bold; 16pt',
                headingType: HeadingType.HEADING_3),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Heading('Heading 4 - Book; 12pt',
                headingType: HeadingType.HEADING_4),
          ),
        ],
      ),
    );
  }

  Widget _bodies(BuildContext context) {
    return Story(
      title: 'Body styles',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Body 1 - Book; 16pt',
                    style: Theme.of(context).textTheme.body1)),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Body 2 - Book; 14pt',
                    style: Theme.of(context).textTheme.body2)),
          )
        ],
      ),
    );
  }

  Widget _textComponents() {
    return const Align(
        alignment: Alignment.centerLeft,
        child: TextPair('Text Pair component heading', 'text pair component body '));
  }
}
