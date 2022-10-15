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
      body: Center(
          child: Column(
        children: [
          TextFormField(),
          ElevatedButton(
              onPressed: () {
                viewModel.signInUser(
                    email: email.text, password: password.text);
              },
              child: const Text("ログイン"))
        ],
      )),
    );
  }
}
