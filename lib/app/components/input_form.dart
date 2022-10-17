import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class InputForm extends StatelessWidget {
  const InputForm({
    super.key,
    required this.onTap,
    required this.text,
  });
  final void Function() onTap;
  final String text;

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
                    color: Color.fromARGB(220, 255, 255, 255),
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
              SizedBox(
                width: 250.w,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "メールアドレス"),
                ),
              ),
              const Gap(30),
              SizedBox(
                width: 250.w,
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "パスワード"),
                ),
              ),
              const Gap(50),
              ElevatedButton(
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
