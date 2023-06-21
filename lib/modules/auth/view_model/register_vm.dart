import 'package:flutter/material.dart';
import 'package:stylclick/shared/enums/view_state.dart';

class RegisterModel extends ChangeNotifier {
  AppState _appState = AppState.initial;

  bool isVisiblePassword = true;
  visiblePassword() {
    isVisiblePassword = !isVisiblePassword;
    notifyListeners();
  }

  bool _isButtonEnabled = false;
  bool get isButtonEnabled => _isButtonEnabled;

  updateButtonState(String? value) {
    _isButtonEnabled = value!.isNotEmpty;
    notifyListeners();
  }

  RegisterModel();

  AppState get appState => _appState;
}
