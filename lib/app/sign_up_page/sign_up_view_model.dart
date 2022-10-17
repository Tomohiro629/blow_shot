import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../service/auth_service.dart';

final signUpViewModelProvider = ChangeNotifierProvider<SignUpViewModel>((ref) {
  return SignUpViewModel(ref.read);
});

class SignUpViewModel extends ChangeNotifier {
  final Reader _reader;
  SignUpViewModel(this._reader);

  Future<void> signUpUser(
      {required String email, required String password}) async {
    await _reader(authServiceProvider)
        .signUpUser(newEmail: email, newPassword: password);
  }
}
