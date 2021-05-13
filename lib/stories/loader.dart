import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/widgets/change_progress_dialog.dart';

ChangeProgressDialog pr;

class Loaders extends StatefulWidget {
  @override
  _LoadersState createState() => _LoadersState();
}

class _LoadersState extends State<Loaders> {
  double percentage = 0.0;

  @override
  Widget build(BuildContext context) {
    pr = new ChangeProgressDialog(context);

    pr.style(progressWidget: const CircularProgressIndicator());

    return Scaffold(
      body: Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                )),
            child: const Text(
              'Show loader',
              style: const TextStyle(color: Colors.white),
            ),
            onPressed: () {
              pr.show();
            }),
      ),
    );
  }
}
