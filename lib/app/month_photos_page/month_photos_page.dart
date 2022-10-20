import 'package:blow_shot/app/month_photos_page/month_photos_view_model.dart';
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
      body: SingleChildScrollView(
        child: PageBackGround(
          colors: const [
            Color.fromARGB(255, 72, 251, 227),
            Color.fromARGB(230, 1, 74, 72)
          ],
          page: FirestoreListView<Photo>(
            query: viewModel.queryMonthPhotos(selectedMonth),
            itemBuilder: (context, snapshot) {
              final photo = snapshot.data();
              return SingleChildScrollView(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 14.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Stack(
                    children: [
                      const Center(
                          child: CircularProgressIndicator(
                        color: Colors.deepOrange,
                      )),
                      Container(
                        height: 250.0.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            image: DecorationImage(
                              image: NetworkImage(photo.imageURL),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
