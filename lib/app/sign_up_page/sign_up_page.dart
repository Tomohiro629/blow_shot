import 'package:blow_shot/app/sign_up_page/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(signUpViewModelProvider);
    final email = TextEditingController();
    final password = TextEditingController();
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          TextFormField(),
          ElevatedButton(
              onPressed: () {
                viewModel.signUpUser(
                    email: email.text, password: password.text);
              },
              child: const Text("サインアップ"))
        ],
      )),
    );
  }
}
