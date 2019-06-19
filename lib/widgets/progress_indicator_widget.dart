
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProgressIndicatorWidget extends StatelessWidget {

  const ProgressIndicatorWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        const CircularProgressIndicator(),
      ],
    );
  }
}