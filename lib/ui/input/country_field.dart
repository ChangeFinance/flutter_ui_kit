import 'dart:async';

import 'package:alpha2_countries/alpha2_countries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/ui/text/body.dart';
import 'package:flutter_ui_kit/ui/text/heading.dart';

import 'allocated_country_codes.dart';
import 'text_field.dart';

class StreamCountryTextField extends StatefulWidget {
  final Stream<String> value;
  final ValueChanged onChanged;
  final String labelText;
  final bool autofocus;
  final bool onlyEEACountries;
  final bool hideStrictJurisdictionCountries;

  const StreamCountryTextField({
    Key key,
    this.value,
    this.onChanged,
    this.labelText,
    this.autofocus,
    this.onlyEEACountries = false,
    this.hideStrictJurisdictionCountries = false,
  }) : super(key: key);

  @override
  StreamCountryTextFieldState createState() {
    return new StreamCountryTextFieldState();
  }
}

class StreamCountryTextFieldState extends State<StreamCountryTextField> {
  final FocusNode _focus = new FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocus);
  }

  void _onFocus() async {
    if (_focus.hasFocus) {
      final countries = _checkStrictJurisdictionCountries(
          _checkOnlyEeaCountries(
              Map<String, String>.from(Countries().countries)));

      final country = await showDialog<String>(
          context: context,
          builder: (context) {
            return _buildDialog(context, countries);
          });
      if (country != null) {
        widget.onChanged(country);
      }
      _focus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamTextField(
      autofocus: widget.autofocus,
      focusNode: _focus,
      value: widget.value,
      labelText: widget.labelText,
    );
  }

  Dialog _buildDialog(BuildContext context, Map<String, String> countries) {
    return Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 280.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
                child: const Heading('Select country')),
            Flexible(child: _buildOptions(countries, context))
          ],
        ),
      ),
    );
  }

  Widget _buildOptions(Map<String, String> countries, BuildContext context) {
    final countryValues = countries.values.toList();
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 16.0),
      itemCount: countryValues.length,
      itemBuilder: (BuildContext context, int index) {
        final value = countryValues[index];
        return SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, value);
          },
          child: Body(value),
        );
      },
    );
  }

  Map<String, String> _checkStrictJurisdictionCountries(
      Map<String, String> countries) {
    if (widget.hideStrictJurisdictionCountries) {
      countries.keys
          .where((key) =>
              strictJurisdictionCountryCodes.contains(key.toUpperCase()))
          .toList()
          .forEach(countries.remove);
    }
    return countries;
  }

  Map<String, String> _checkOnlyEeaCountries(Map<String, String> countries) {
    if (widget.onlyEEACountries) {
      countries.keys
          .where((key) => !eeaCountryCodes.contains(key.toUpperCase()))
          .toList()
          .forEach(countries.remove);
    }
    return countries;
  }
}
