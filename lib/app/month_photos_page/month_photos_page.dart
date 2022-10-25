import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfire_ui/firestore.dart';

import '../../business/model/photo_model.dart';
import '../../service/auth_service.dart';
import '../../service/common_method.dart';
import '../components/app_colors.dart';
import '../components/base_app_bar.dart';
import '../components/page_back_ground.dart';
import 'month_photos_view_model.dart';

class MonthPhotosPage extends ConsumerWidget {
  const MonthPhotosPage({super.key, required this.selectedMonth});
  final String selectedMonth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(monthPhotosViewModelProvider);
    final now = DateTime.now();
    return Scaffold(
      appBar: BaseAppBar(
          title: Text(selectedMonth),
          widgets: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: IconButton(
                  onPressed: () {
                    ref.watch(authServiceProvider).logOut();
                  },
                  icon: const Icon(Icons.logout_outlined)),
            ),
          ],
          color: const Color.fromARGB(255, 21, 69, 24)),
      body: PageBackGround(
        colors: const [Color.fromARGB(255, 72, 251, 227), AppColors.secondary],
        page: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 500.h,
              child: FirestoreListView<Photo>(
                query: viewModel.queryTodayPhotos(selectedMonth),
                itemBuilder: (context, snapshot) {
                  final photo = snapshot.data();
                  return Stack(
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
                              "2022年${now.month.toString()}月",
                              style: TextStyle(
                                  fontSize: 20.sp, color: AppColors.secondary),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Dismissible(
                        key: Key(photo.imageURL),
                        onDismissed: (direction) async {
                          photo;
                          if (direction == DismissDirection.startToEnd) {
                            final prevPhoto = await viewModel
                                .getSelectedDayPhoto(getDateString(
                                    now.subtract(const Duration(days: 1))));
                            if (prevPhoto != null) {
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => MonthPhotosPage(
                                            selectedMonth: prevPhoto.yyyyMMdd,
                                          ))));
                              print(prevPhoto.yyyyMMdd);
                            }
                          } else {
                            final nextPhoto = await viewModel
                                .getSelectedDayPhoto(getDateString(
                                    now.add(const Duration(days: 1))));
                            print(nextPhoto!.yyyyMMdd);
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => MonthPhotosPage(
                                          selectedMonth: nextPhoto.yyyyMMdd,
                                        ))));
                          }
                        },
                        background: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "Back",
                              style: TextStyle(
                                  color: AppColors.secondary, fontSize: 50.sp),
                            ),
                          ),
                        ),
                        secondaryBackground: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "Next",
                              style: TextStyle(
                                  color: AppColors.secondary, fontSize: 50.sp),
                            ),
                          ),
                        ),
                        child: Container(
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
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
