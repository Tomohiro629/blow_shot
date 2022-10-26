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
    return Swiper(
      layout: SwiperLayout.TINDER,
      itemBuilder: ((context, index) {
        return StreamBuilder<List<Photo>>(
          stream: viewModel.fetchMonthPhotoStream(
            selectedMonth,
          ),
          builder: (context, AsyncSnapshot<List<Photo>> snapshot) {
            final isMonthDate = snapshot.data != null;
            if (isMonthDate) {
              return Stack(
                  children: snapshot.data!.map((Photo photo) {
                final List<Photo> images = [photo];

                return SizedBox(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                            color: Color.fromARGB(255, 21, 69, 24),
                          ),
                          height: 350.0.h,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              selectedMonth,
                              style: TextStyle(
                                  fontSize: 20.sp, color: AppColors.secondary),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 300.0.h,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          image: DecorationImage(
                            image: NetworkImage(photo.imageURL),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black),
                              child: Text(
                                "${getDayString(photo.timeStamp)}日",
                                style: TextStyle(
                                    fontSize: 30.sp,
                                    color: AppColors.secondary),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList());
            }
            {
              return const Center(
                child: Text("のーでーた"),
              );
            }
          },
        );
      }),
      index: 0,
      itemCount: 30,
      itemWidth: 300.0.w,
      itemHeight: 500.0.h,
      autoplay: false,
      loop: true,
    );
  }
}
