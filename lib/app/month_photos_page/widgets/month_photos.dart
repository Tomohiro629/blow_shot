import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

import '../../../service/common_method.dart';
import '../../components/app_colors.dart';
import '../month_photos_view_model.dart';
import '../../../business/model/photo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MonthPhotos extends ConsumerWidget {
  const MonthPhotos({
    super.key,
    required this.selectedMonth,
  });
  final String selectedMonth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(monthPhotosViewModelProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(60.0),
          child: Text(
            "日めくり写真",
            style: TextStyle(color: AppColors.accent, fontSize: 35.sp),
          ),
        ),
        Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 13, 61, 15),
              height: 50.h,
              width: double.infinity,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  selectedMonth,
                  style: TextStyle(fontSize: 20.sp, color: AppColors.secondary),
                ),
              ),
            ),
            Container(
              color: const Color.fromARGB(240, 255, 255, 255),
              height: 300.h,
              width: double.infinity,
              child: Swiper(
                layout: SwiperLayout.TINDER,
                itemBuilder: ((context, index) {
                  return StreamBuilder<List<Photo>>(
                    stream: viewModel.fetchMonthPhotoStream(
                      selectedMonth,
                    ),
                    builder: (context, AsyncSnapshot<List<Photo>> snapshot) {
                      final isMonthDate = snapshot.data != null;

                      if (isMonthDate) {
                        final urlList = snapshot.data!
                            .map((Photo photo) => photo.imageURL)
                            .toList();
                        final day = snapshot.data!
                            .map((Photo photo) => photo.timeStamp)
                            .toList();
                        return Stack(
                            children: snapshot.data!.map((Photo photo) {
                          return Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30)),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        urlList[index % urlList.length]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.black),
                                      child: Text(
                                        "${getDayString(day[index % day.length])}日",
                                        style: TextStyle(
                                            fontSize: 30.sp,
                                            color: AppColors.secondary),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList());
                      }
                      {
                        return const Center(
                          child: Text(""),
                        );
                      }
                    },
                  );
                }),
                index: 0,
                itemCount: 31,
                itemWidth: 400.0.w,
                itemHeight: 300.0.h,
                loop: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
