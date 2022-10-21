import 'package:blow_shot/app/components/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../business/model/photo_model.dart';
import '../../../service/common_method.dart';
import '../blow_shot_view_model.dart';

class BlowShotImage extends ConsumerWidget {
  const BlowShotImage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(blowShotViewModel);
    final today = getDateString(DateTime.now());

    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: AppColors.secondary, spreadRadius: 5, offset: Offset(1, 1))
        ],
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<List<Photo>>(
            stream: viewModel.fetchDayPhotoStream(today),
            builder: (context, AsyncSnapshot<List<Photo>> snapshot) {
              final isDay = snapshot.data != null;
              if (isDay) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: snapshot.data!.map((Photo photo) {
                            return Center(
                                child: Column(
                              children: [
                                Text(
                                  "本日の写真！",
                                  style: TextStyle(
                                    fontSize: 40.sp,
                                  ),
                                ),
                                const Gap(50),
                                Container(
                                  height: 250.h,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 175, 194, 2),
                                            blurRadius: 10.0,
                                            spreadRadius: 1.0,
                                            offset: Offset(5, 5))
                                      ],
                                      borderRadius: BorderRadius.circular(5.0),
                                      image: DecorationImage(
                                        image: NetworkImage(photo.imageURL),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                const Gap(50),
                                Text(
                                  "また明日！！",
                                  style: TextStyle(
                                    fontSize: 30.sp,
                                  ),
                                )
                              ],
                            ));
                          }).toList())),
                );
              }
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
