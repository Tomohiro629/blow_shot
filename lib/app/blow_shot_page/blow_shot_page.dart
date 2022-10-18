import 'package:blow_shot/app/components/app_colors.dart';
import 'package:blow_shot/app/components/page_back_ground.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlowShotPage extends ConsumerWidget {
  const BlowShotPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: PageBackGround(
        colors: const [Colors.yellowAccent, Colors.black],
        page: Center(
            child: Column(
          children: [
            IconButton(
              icon: const Icon(
                Icons.photo_camera_outlined,
                color: AppColors.primary,
              ),
              onPressed: () {},
            ),
            const Text("一撃で決めろ！")
          ],
        )),
      ),
    );
  }
}
