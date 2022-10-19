import 'package:blow_shot/app/blow_shot_page/widgets/blow_shot_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../business/model/photo_model.dart';
import '../components/app_colors.dart';
import '../components/page_back_ground.dart';
import 'blow_shot_view_model.dart';

class BlowShotPage extends ConsumerWidget {
  const BlowShotPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(blowShotViewModel);

    return Scaffold(
      body: PageBackGround(
        colors: const [AppColors.accent, Colors.black],
        page: Stack(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 100.0, horizontal: 20.0),
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
                  child: StreamBuilder<List<Photo>>(
                    stream: viewModel.fetchPhotoStream(),
                    builder: (context, AsyncSnapshot<List<Photo>> snapshot) {
                      if (snapshot.hasData) {
                        return SizedBox(
                          height: 500.h,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: snapshot.data!.map((Photo photo) {
                                return Column(
                                  children: [
                                    Text(
                                      "本日の写真！",
                                      style: TextStyle(
                                        fontSize: 40.sp,
                                      ),
                                    ),
                                    Image.network(photo.imageURL),
                                    Text(
                                      "また明日！！",
                                      style: TextStyle(
                                        fontSize: 30.sp,
                                      ),
                                    )
                                  ],
                                );
                              }).toList()),
                        );
                      }
                      if (snapshot.hasError) {
                        Center(
                          child: Text(
                            "エラー",
                            style: TextStyle(
                                color: AppColors.caution, fontSize: 30.sp),
                          ),
                        );
                      }
                      return SizedBox(
                          height: 500.h,
                          child: const Align(
                              alignment: Alignment.center,
                              child: BlowShotButton()));
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
