import 'package:blow_shot/app/components/page_back_ground.dart';
import 'package:blow_shot/app/sign_in_page/sign_in_page.dart';
import 'package:blow_shot/app/sign_up_page/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: PageBackGround(
        colors: const [
          Color.fromARGB(255, 245, 251, 72),
          Color.fromARGB(230, 228, 108, 16)
        ],
        page: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 150.h,
                      width: 150.w,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.h, left: 20.w),
                        child: Text(
                          "一撃",
                          style: TextStyle(fontSize: 60.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 150.h,
                      width: 150.w,
                      child: Padding(
                        padding: EdgeInsets.only(top: 60.h),
                        child: Text(
                          "必撮",
                          style: TextStyle(fontSize: 60.sp, color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "-Blow Shot-",
                  style: TextStyle(fontSize: 20.sp, color: Colors.white),
                )
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const SignInPage();
                      }));
                    },
                    child: const Text("ログイン")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const SignUpPage();
                      }));
                    },
                    child: const Text("サインアップ")),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
