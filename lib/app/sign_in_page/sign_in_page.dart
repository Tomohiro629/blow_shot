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
                  explanation: "アカウント作成済の方",
                  onTap: () {
                    try {
                      viewModel.signInUser(
                          email: email.text, password: password.text);
                    } catch (e) {}
                  },
                  text: 'ログイン'))),
    );
  }
}
