import 'package:blow_shot/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signInViewModelProvider = ChangeNotifierProvider<SignInViewModel>((ref) {
  return SignInViewModel(ref.read);
});

class SignInViewModel extends ChangeNotifier {
  final Reader _reader;
  SignInViewModel(this._reader);

  Future<void> signInUser(
      {required String email, required String password}) async {
    await _reader(authServiceProvider)
        .signInUser(email: email, password: password);
  }
}
