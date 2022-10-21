import 'package:blow_shot/app/components/app_colors.dart';
import 'package:blow_shot/app/month_photos_page/month_photos_view_model.dart';
import 'package:blow_shot/service/common_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfire_ui/firestore.dart';

import '../../business/model/photo_model.dart';
import '../components/page_back_ground.dart';

class MonthPhotosPage extends ConsumerWidget {
  const MonthPhotosPage({super.key, required this.selectedMonth});
  final String selectedMonth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(monthPhotosViewModelProvider);
    return Scaffold(
      body: PageBackGround(
        colors: const [
          Color.fromARGB(255, 72, 251, 227),
          Color.fromARGB(230, 1, 74, 72)
        ],
        page: FirestoreListView<Photo>(
          query: viewModel.queryMonthPhotos(selectedMonth),
          itemBuilder: (context, snapshot) {
            final photo = snapshot.data();
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: const Color.fromARGB(255, 154, 149, 149),
                  ),
                  height: 350.0.h,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "2022年${DateTime.now().month.toString()}月",
                      style: TextStyle(
                          fontSize: 20.sp, color: AppColors.secondary),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  height: 300.0.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    image: DecorationImage(
                      image: NetworkImage(photo.imageURL),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  color: AppColors.secondary,
                  child: Text("${getDayString(photo.timeStamp)}月"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
