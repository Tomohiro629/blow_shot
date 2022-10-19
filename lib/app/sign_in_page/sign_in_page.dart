import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/input_form.dart';
import '../components/page_back_ground.dart';
import 'sign_in_view_model.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(signInViewModelProvider);
    final email = TextEditingController();
    final password = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
          child: PageBackGround(
              colors: const [
            Color.fromARGB(255, 72, 251, 251),
            Color.fromARGB(230, 16, 44, 228)
          ],
              page: InputForm(
                emailController: email,
                passwordController: password,
                explanation: "アカウント作成済の方",
                onTap: () async {
                  try {
                    await viewModel.signInUser(
                        email: email.text, password: password.text);
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  } catch (e) {
                    if (e.toString() ==
                        "[firebase_auth/unknown] Given String is empty or null") {
                      viewModel.setErrorText("メールアドレス又はパスワード未入力です。");
                    } else if (e.toString() ==
                        "[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.") {
                      viewModel.setErrorText("登録のないメールアドレスです。");
                    } else {
                      viewModel.setErrorText("ログインエラー\n再度お試しください。");
                    }
                  }
                },
                text: 'ログイン',
                errorText: viewModel.errorText,
              ))),
    );
  }
}
