import 'dart:async';

import 'package:changeapp_common/model/error.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'text/body.dart';

class StreamErrorContainer extends StatelessWidget {
  final Stream<ErrorMessage> stream;

  const StreamErrorContainer({this.stream});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ErrorMessage>(
      stream: stream,
      builder: (context, snapshot) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: ErrorContainer(snapshot.data?.message),
            ),
          ],
        );
      },
    );
  }
}


class StreamErrorContainerNewStyle extends StatelessWidget {
  final Stream<ErrorMessage> stream;
  final TextAlign textAlign;
  const StreamErrorContainerNewStyle({this.stream, this.textAlign});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.body2.copyWith(color: Colors.red);

    return StreamBuilder<ErrorMessage>(
      stream: stream,
      builder: (context, snapshot) {
        return snapshot.data != null
          ? Text(snapshot.data?.message, style: style, textAlign: textAlign)
          : Text('', style: style);
      },
    );
  }
}

class ErrorContainer extends StatelessWidget {
  final String data;

  const ErrorContainer(this.data);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: data == null ? 0.0 : 1.0,
      child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(6.0)),
              color: AppColors.warning),
          child: Body(data ?? '', style: BodyStyle.body2)),
    );
  }
}
