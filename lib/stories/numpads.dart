import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/widgets/text/numpad_text.dart';

class NumPads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(child: _numPadStory(context)));
  }

  Widget _numPadStory(BuildContext context) {
    final _textEditingController = TextEditingController();
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
        alignment: Alignment.bottomRight,
        padding: const EdgeInsets.all(30.0),
        child: IgnorePointer(
          child: TextField(
            keyboardType: TextInputType.number,
            enabled: true,
            autofocus: true,
            controller: _textEditingController,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.display2.copyWith(fontFamily: 'CircularPro-Book', fontWeight: FontWeight.normal, color: Colors.black, fontSize: 24.0),
            decoration: InputDecoration.collapsed(
                hintText: '0',
                hintStyle: const TextStyle(color: Colors.black, fontSize: 24.0)),
          ),
        ),
      ),
     Center(child: NumPadText(textEditingController: _textEditingController))
    ]);
  }
}
