import 'package:blow_shot/app/components/app_colors.dart';
import 'package:blow_shot/app/sign_up_page/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../components/page_back_ground.dart';
import '../liquid_swipe_page/liquid_swipe_page.dart';
import '../sign_in_page/sign_in_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: PageBackGround(
        colors: const [
          Color.fromARGB(255, 140, 131, 1),
          Color.fromARGB(230, 244, 76, 4)
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
                Gap(30.h),
                Text(
                  "-Blow Shot-",
                  style: TextStyle(fontSize: 25.sp, color: Colors.white),
                )
              ],
            ),
            Column(
              children: [
                MaterialButton(
                    splashColor: AppColors.accent,
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const LiquidSwipePage(
                          pages: [SignUpPage(), SignInPage()],
                        );
                      }));
                    },
                    child: const Text(
                      "撮影開始",
                      style: TextStyle(fontSize: 30.0),
                    )),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
