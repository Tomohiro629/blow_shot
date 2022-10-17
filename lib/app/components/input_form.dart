import 'package:blow_shot/app/components/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class InputForm extends StatelessWidget {
  const InputForm(
      {super.key,
      required this.onTap,
      required this.text,
      required this.explanation});
  final void Function() onTap;
  final String text;
  final String explanation;

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
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "パスワード"),
                ),
              ),
              const Gap(50),
              MaterialButton(
                color: AppColors.secondary,
                onPressed: onTap,
                child: Text(text),
              )
            ],
          ),
        ),
      ],
    );
  }
}
