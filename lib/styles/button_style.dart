import 'package:fluent_ui/fluent_ui.dart';

Color _primaryColor(Set<ButtonStates> state) {
  if(state.contains(ButtonStates.hovering)) {
    return Colors.blue.dark;
  } else if (state.contains(ButtonStates.disabled)) {
    return Colors.blue.lightest;
  } else if (state.contains(ButtonStates.pressing)) {
    return Colors.blue.light;
  } else if (state.contains(ButtonStates.focused)) {
    return Colors.blue.lightest;
  } else {
    return Colors.blue;
  }
}

Color _primaryText(Set<ButtonStates> state) {
  if(state.contains(ButtonStates.hovering)) {
    return Colors.white;
  } else if (state.contains(ButtonStates.disabled)) {
    return Colors.grey[100];
  } else if (state.contains(ButtonStates.pressing)) {
    return Colors.white;
  } else if (state.contains(ButtonStates.focused)) {
    return Colors.white;
  } else {
    return Colors.white;
  }
}

ButtonStyle primaryButtonStyle() {
  return ButtonStyle(
    backgroundColor: ButtonState.resolveWith(_primaryColor),
    foregroundColor: ButtonState.resolveWith(_primaryText)
  );
}