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
      body: SingleChildScrollView(
          child: PageBackGround(
              colors: const [
            Color.fromARGB(255, 72, 251, 102),
            Color.fromARGB(230, 6, 74, 1)
          ],
              page: InputForm(
                explanation: "アカウントお持ちでない方",
                onTap: () {
                  try {
                    viewModel.signUpUser(
                        email: email.text, password: password.text);
                  } catch (e) {}
                },
                text: 'サインアップ',
                errorText: viewModel.errorText,
              ))),
    );
  }
}
