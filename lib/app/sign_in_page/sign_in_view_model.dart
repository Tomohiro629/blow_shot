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
    try {
      await _reader(authServiceProvider)
          .signInUser(email: email, password: password);
    } catch (e) {
      if (e.toString() ==
          "[firebase_auth/unknown] Given String is empty or null") {
        errorText = ("メールアドレス又はパスワード未入力です。");
      } else if (e.toString() ==
          "[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.") {
        errorText = ("登録のないメールアドレスです。");
      } else {
        errorText = ("ログインエラー\n再度お試しください。");
      }
    }
    notifyListeners();
  }
}
