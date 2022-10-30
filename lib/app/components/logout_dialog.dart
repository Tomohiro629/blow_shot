import 'package:blow_shot/app/components/app_colors.dart';
import 'package:blow_shot/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoutDialog extends ConsumerWidget {
  const LogoutDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text(
        "ログアウト",
        textAlign: TextAlign.center,
      ),
      content: const Text("ログアウトしてもいいですか？"),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: AppColors.caution, width: 5.w),
              ),
              onPressed: () {
                ref.watch(authServiceProvider).logOut();
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "ログアウトしました。",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black),
                    ),
                    backgroundColor: AppColors.caution,
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Text("はい"),
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: AppColors.accent, width: 5.w),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("いいえ"),
            ),
          ],
        )
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: AppColors.primary,
          width: 3,
        ),
      ),
    );
  }
}
