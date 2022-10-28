import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'app_colors.dart';

class InputForm extends StatelessWidget {
  const InputForm(
      {super.key,
      required this.onTap,
      required this.text,
      required this.emailController,
      required this.passwordController,
      required this.explanation,
      required this.errorText});

  final void Function() onTap;
  final String text;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String explanation;
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(vertical: 100.0, horizontal: 20.0),
          child: Container(
            height: 500.h,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: AppColors.primary),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(150, 255, 255, 255),
                    spreadRadius: 5,
                    offset: Offset(1, 1))
              ],
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    explanation,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const Gap(80),
                  Container(
                    width: 250.w,
                    decoration: const BoxDecoration(
                      color: AppColors.secondary,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(hintText: "メールアドレス"),
                      ),
                    ),
                  ),
                  const Gap(30),
                  Container(
                    width: 250.w,
                    decoration: const BoxDecoration(
                      color: AppColors.secondary,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration:
                            const InputDecoration(hintText: "パスワード(8文字以上)"),
                      ),
                    ),
                  ),
                  const Gap(50),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: AppColors.primary, width: 5.w),
                    ),
                    color: AppColors.secondary,
                    onPressed: onTap,
                    child: Text(text),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      errorText,
                      style: const TextStyle(color: AppColors.caution),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
