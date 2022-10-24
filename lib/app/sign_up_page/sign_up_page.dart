import 'package:blow_shot/app/components/app_colors.dart';
import 'package:blow_shot/app/components/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/input_form.dart';
import '../components/page_back_ground.dart';
import 'sign_up_view_model.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(signUpViewModelProvider);
    final email = TextEditingController();
    final password = TextEditingController();
    return Scaffold(
      appBar: const BaseAppBar(
        title: Text("ろぐいん"),
        color: Color.fromARGB(230, 6, 74, 1),
        widgets: [],
      ),
      body: SingleChildScrollView(
          child: PageBackGround(
              colors: const [
            Color.fromARGB(255, 72, 251, 102),
            AppColors.secondary
          ],
              page: InputForm(
                emailController: email,
                passwordController: password,
                explanation: "アカウントお持ちでない方",
                onTap: () async {
                  try {
                    if (password.text.length > 8) {
                      await viewModel.signUpUser(
                          email: email.text, password: password.text);
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    } else {
                      viewModel.setErrorText("パスワードは8文字以上です");
                    }
                  } catch (e) {
                    if (e.toString() ==
                        "[firebase_auth/unknown] Given String is empty or null") {
                      viewModel.setErrorText("メールアドレス又はパスワード未入力です。");
                    } else if (password.text.length < 8) {
                      viewModel.setErrorText("パスワードは8文字以上です。");
                      // ignore: unrelated_type_equality_checks
                    } else if (e.toString() ==
                        "[firebase_auth/email-already-in-use] The email address is already in use by another account.") {
                      viewModel.setErrorText('既にこのメールアドレスは利用されてます。');
                    } else {
                      viewModel.setErrorText("登録エラー\n再度お試しください。");
                    }
                  }
                },
                text: 'サインアップ',
                errorText: viewModel.errorText,
              ))),
    );
  }
}
