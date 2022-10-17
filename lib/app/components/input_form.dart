import 'package:blow_shot/app/components/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

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
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(175, 255, 255, 255),
                    spreadRadius: 5,
                    offset: Offset(1, 1))
              ],
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                explanation,
                style: const TextStyle(fontSize: 18),
              ),
              const Gap(50),
              Container(
                color: Colors.white,
                width: 250.w,
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "メールアドレス"),
                ),
              ),
              const Gap(30),
              Container(
                color: Colors.white,
                width: 250.w,
                child: TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "パスワード(8文字以上)"),
                ),
              ),
              const Gap(50),
              MaterialButton(
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
      ],
    );
  }
}
