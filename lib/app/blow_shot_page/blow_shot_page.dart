import 'package:blow_shot/app/blow_shot_page/widgets/blow_shot_button.dart';
import 'package:blow_shot/app/blow_shot_page/widgets/blow_shot_image.dart';
import 'package:flutter/material.dart';

import '../components/app_colors.dart';
import '../components/page_back_ground.dart';

class BlowShotPage extends StatelessWidget {
  const BlowShotPage({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: PageBackGround(
        colors: const [
          Color.fromARGB(163, 35, 135, 217),
          AppColors.accent,
        ],
        page: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 100.0, horizontal: 20.0),
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.secondary,
                        spreadRadius: 5,
                        offset: Offset(1, 1))
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Center(
                  child: Stack(
                    children: const [BlowShotButton(), BlowShotImage()],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
