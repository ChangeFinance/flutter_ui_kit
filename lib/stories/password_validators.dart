import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/story_book/expandable_story.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/string_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/props_explorer.dart';
import 'package:flutter_ui_kit/widgets/password_validator.dart';

class PasswordValidators extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _simplePasswordValidatorStory(),
          ],
        ),
      ),
    );
  }

  Widget _simplePasswordValidatorStory() {
    
    final hintList = ['Try making it longer then 8 digits and adding capital characters that makes it difficult for others to guess',
    'That is a good password, but you can try to add digits and special characters to make it a great one!',
    'Remember to always keep your passwords secure'];
    final strengthList = ['bad', 'weak', 'normal', 'good', 'great'];
    final colorList = [Colors.redAccent, Colors.orangeAccent, Colors.blueAccent, Colors.lightGreen, Colors.greenAccent];
    return ExpandableStory(
      title: 'Password Validator',
      child: PropsExplorer(
        initialProps: <String, dynamic> {
          'password': 'Password123*',
          'hintList': hintList,
          'strengthList': strengthList,
          'colorList': colorList,
        },
        formBuilder: (context, props, updateProp) {
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              StringPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'password',
              )
            ],
          );
        },
        widgetBuilder: (context, props) {
          final String password = props['password'];

          return Container(
            child: PasswordValidator(
              password: password,
              hintList: hintList,
              strengthList: strengthList,
              colorList: colorList,
            ),
          );
        },
      ),
    );
  }

}