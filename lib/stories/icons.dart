import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/story_book/story.dart';

class IconsStory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Story(
      title: 'Icons',
      child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            padding: const EdgeInsets.all(20.0),
            crossAxisSpacing: 10.0,
            children: <Widget>[
              _firstIcon()
            ],
          )
      ),
    );
  }

  Widget _firstIcon() {
    return Card(
      child: const ListTile(
        leading: ImageIcon(
          AssetImage('lib/assets/savingsToBitcoin.png')
        ),
        title: Text('Test'),
      ),
    );
  }
}