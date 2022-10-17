import 'package:blow_shot/app/components/page_back_ground.dart';
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
      body: SingleChildScrollView(
          child: PageBackGround(
        colors: const [
          Color.fromARGB(255, 72, 251, 102),
          Color.fromARGB(230, 6, 74, 1)
        ],
        page: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 100.0, horizontal: 20.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(),
                ElevatedButton(
                    onPressed: () {
                      try {
                        viewModel.signUpUser(
                            email: email.text, password: password.text);
                      } catch (e) {}
                    },
                    child: const Text("サインアップ"))
              ],
            ),
          ],
        ),
      )),
    );
  }
}
