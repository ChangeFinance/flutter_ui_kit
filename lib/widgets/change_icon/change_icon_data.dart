import 'change_icon_state.dart';

class ChangeIconData {
  final String _iconName;
  final ChangeIconState _state;

  const ChangeIconData(this._iconName, this._state);

  String getIconPath() {
    return 'assets/icons/${_iconName}_${_getStateString(_state)}.svg';
  }

  String _getStateString(ChangeIconState state) {
    var stateString = '';

    switch(state) {
      case ChangeIconState.enabled:
        stateString = 'enabled';
        break;

      case ChangeIconState.disabled:
        stateString = 'disabled';
        break;
    }

    return stateString;
  }
}