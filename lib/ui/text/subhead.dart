import 'package:flutter/material.dart';

import '../theme.dart';

class Subhead extends StatelessWidget {
  final String data;

  const Subhead(this.data);

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
