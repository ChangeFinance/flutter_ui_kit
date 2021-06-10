import 'package:flutter/material.dart';

import '../theme.dart';

class ChgSubHead extends StatelessWidget {
  final String data;

  const ChgSubHead(this.data);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          data,
          style: subHeadingStyle,
        ),
      ),
    );
  }
}
