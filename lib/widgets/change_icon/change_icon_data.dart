import 'change_icon_type.dart';

class ChangeIconData {
  final String _iconName;
  final ChangeIconType _state;

  const ChangeIconData(this._iconName, this._state);

  String getIconPath() {
    return 'lib/assets/icons/${_iconName}_${_getStateString(_state)}.svg';
  }

  String _getStateString(ChangeIconType state) {
    var stateString = '';

    switch(state) {
      case ChangeIconType.enabled:
        stateString = 'enabled';
        break;

      case ChangeIconType.disabled:
        stateString = 'disabled';
        break;
    }

    return stateString;
  }
}