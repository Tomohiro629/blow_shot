import 'package:blow_shot/tinder/tinder_page.dart';
import 'package:flutter/material.dart';

import '../components/app_colors.dart';
import '../components/base_app_bar.dart';
import '../components/page_back_ground.dart';
import 'widgets/blow_shot_button.dart';
import 'widgets/blow_shot_image.dart';

class BlowShotPage extends StatelessWidget {
  const BlowShotPage({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: Text("きょうのいちまい"),
        color: Colors.indigo,
        widgets: [],
      ),
      body: PageBackGround(
        colors: const [AppColors.accent, AppColors.secondary],
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
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const TinderPage();
                            },
                          ),
                        );
                      },
                      child: const Text("Tinder Start"))),
            )
          ],
        ),
      ),
    );
  }
}
