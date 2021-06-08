import 'package:flutter/material.dart';

import 'change_app_icons.dart';

class CustomCheckbox extends StatelessWidget {

  final bool? isChecked;
  final ValueChanged<bool> onChanged;
  final Widget? label;
  final String? errorText;


  const CustomCheckbox({
    required this.isChecked,
    required this.onChanged,
    Key? key,
    this.label,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: errorText == null
          ? [buildCheckboxTile()]
          : [buildCheckboxTile(), buildError(context)]
    );
  }

  Widget buildError(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      constraints: const BoxConstraints.tightFor(width: double.infinity),
      padding: const EdgeInsets.only(left: 35.0),
      child: Text(
          errorText!,
          style: TextStyle(color: theme.errorColor, fontSize: 12.0)
      ),
    );
  }

  Widget buildCheckboxTile() {
    return GestureDetector (
      onTap: (){onChanged(!isChecked!);},
      child: Container(
        margin: const EdgeInsets.only(top: 14.00),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
                height: 24.0,
                width: 24.0,
                child: _icon(isChecked!)
            ),
            new Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10.00),
                child: label
            ),
          ],
        ),
      )
    );
  }

  Widget _icon(bool isChecked) {
    return isChecked
        ? Container(child: ChangeAppIcons.checkbox_checked)
        : ChangeAppIcons.checkbox_unchecked;
  }
}
