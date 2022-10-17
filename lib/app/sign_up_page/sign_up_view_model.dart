import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../service/auth_service.dart';

final signUpViewModelProvider = ChangeNotifierProvider<SignUpViewModel>((ref) {
  return SignUpViewModel(ref.read);
});

class SignUpViewModel extends ChangeNotifier {
  final Reader _reader;
  SignUpViewModel(this._reader);
  String errorText = '';

  Future<void> signUpUser(
      {required String email, required String password}) async {
    try {
      await _reader(authServiceProvider)
          .signUpUser(newEmail: email, newPassword: password);
    } catch (e) {
      if (e.toString() ==
          "[firebase_auth/unknown] Given String is empty or null") {
        errorText = ("メールアドレス又はパスワード未入力です。");
      } else if (password.length < 8) {
        errorText = ("パスワードは8文字以上です。");
        // ignore: unrelated_type_equality_checks
      } else if (e.toString() ==
          "[firebase_auth/email-already-in-use] The email address is already in use by another account.") {
        errorText = ('既にこのメールアドレスは利用されてます。');
      } else {
        errorText = ("登録エラー\n再度お試しください。");
      }
      notifyListeners();
    }
  }
}
