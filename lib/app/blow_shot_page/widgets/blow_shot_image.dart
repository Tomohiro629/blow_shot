import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              color: Color.fromARGB(255, 81, 164, 143),
              spreadRadius: 5,
              offset: Offset(1, 1))
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
                                SizedBox(
                                  width: double.infinity,
                                  height: 200.h,
                                  child: Image.network(photo.imageURL),
                                ),
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
