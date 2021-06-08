import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../color.dart';

class TransactionListItemContainer extends StatelessWidget {
  final String? title;
  final List<Widget>? transactionListItems;

  const TransactionListItemContainer({this.title, this.transactionListItems});

  @override
  Widget build(BuildContext context) {
    if (transactionListItems!.isEmpty) {
      return const SizedBox.shrink();
    }
    final widgets = <Widget>[];
    widgets.add(_getTitle(title!));
    widgets.addAll(transactionListItems!);

    return Container(
        decoration: const BoxDecoration(
            border: const Border(
          bottom: const BorderSide(width: 1.0, color: AppColor.lightestGrey),
        )),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: widgets));
  }

  Widget _getTitle(String _title) {
    return Padding(
        padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
        child: Text(_title,
            textAlign: TextAlign.left,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: _greyTextStyle()));
  }

  TextStyle _greyTextStyle() {
    return const TextStyle(
        height: 1.428,
        fontSize: 14.0,
        fontFamily: 'DINNextLTPro',
        fontWeight: FontWeight.normal,
        letterSpacing: 0.02,
        color: AppColor.semiGrey);
  }
}
