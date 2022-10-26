import 'package:blow_shot/app/components/app_colors.dart';
import 'package:blow_shot/app/components/base_app_bar.dart';
import 'package:blow_shot/app/components/page_back_ground.dart';
import 'package:blow_shot/app/swiper_view_demo/sairi_photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class SairiSwiped extends ConsumerWidget {
  const SairiSwiped({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: Text("さいりコレクション"),
        widgets: [],
        color: Color.fromARGB(165, 220, 94, 136),
      ),
      body: PageBackGround(
        colors: const [Colors.pink, AppColors.secondary],
        page: Swiper(
          layout: SwiperLayout.TINDER,
          itemBuilder: ((context, index) {
            return ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  images[index % images.length],
                  fit: BoxFit.cover,
                ));
          }),
          itemCount: images.length,
          itemWidth: 300.0.w,
          itemHeight: 500.0.h,
          pagination: const SwiperPagination(),
          control: const SwiperControl(),
        ),
      ),
    );
  }
}
