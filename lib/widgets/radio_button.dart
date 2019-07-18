import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class RadioButton extends StatefulWidget {
  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {

  String _picked = "Two";
  @override
  Widget build(BuildContext context) {
    return RadioButtonGroup(
      orientation: GroupedButtonsOrientation.VERTICAL,
      labelStyle: TextStyle(backgroundColor: Colors.amber),
      margin: const EdgeInsets.only(left: 12.0),
      onSelected: (String selected) => setState(() {
             _picked = selected;
          }),
      labels: const <String>[
        "One",
        "Two",
      ],
      picked: _picked,
      itemBuilder: (Radio rb, Text txt, int i){
        return Row(
          children: <Widget>[
            myWidget(),
            const Icon(Icons.check_circle),
            rb,
            txt
          ],
        );
      },
    );
  }

  Widget myWidget() {

    return Container(
      margin: const EdgeInsets.all(30.0),
      padding: const EdgeInsets.all(10.0),
      decoration:  new BoxDecoration(
        image:  new DecorationImage(image: const AssetImage('assets/checkmark.png'), fit: BoxFit.cover),
        shape: BoxShape.circle,
      ), //       <--- BoxDecoration here
    );
    
   
  }
}
