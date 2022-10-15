import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                width: 180.w,
                child: const Text("一撃"),
              ),
              SizedBox(
                width: 180.w,
                child: const Text("必撮"),
              )
            ],
          ),
          ElevatedButton(onPressed: () {}, child: const Text("ログイン")),
          ElevatedButton(onPressed: () {}, child: const Text("サインアップ"))
        ],
      )),
    );
  }
}
