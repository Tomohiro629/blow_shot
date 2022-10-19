import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../service/auth_service.dart';

final signInViewModelProvider = ChangeNotifierProvider<SignInViewModel>((ref) {
  return SignInViewModel(ref.read);
});

class SignInViewModel extends ChangeNotifier {
  final Reader _reader;
  SignInViewModel(this._reader);
  String errorText = '';

  Future<void> signInUser(
      {required String email, required String password}) async {
    await _reader(authServiceProvider)
        .signInUser(email: email, password: password);
    notifyListeners();
  }

  void setErrorText(String errorMsg) {
    errorText = errorMsg;
    notifyListeners();
  }
}
