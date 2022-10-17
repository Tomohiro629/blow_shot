import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  const InputForm({super.key, required this.onTap, required this.text});
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
              onPressed: onTap,
              child: Text(text),
            )
          ],
        ),
      ],
    );
  }
}
