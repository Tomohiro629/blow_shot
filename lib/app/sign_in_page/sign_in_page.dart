import 'package:blow_shot/app/components/input_form.dart';
import 'package:blow_shot/app/components/page_back_ground.dart';
import 'package:blow_shot/app/sign_in_page/sign_in_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
