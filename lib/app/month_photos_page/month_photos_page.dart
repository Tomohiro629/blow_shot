import 'package:blow_shot/app/month_photos_page/widgets/month_photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

import '../../service/auth_service.dart';
import '../components/app_colors.dart';
import '../components/base_app_bar.dart';
import '../components/page_back_ground.dart';

class MonthPhotosPage extends ConsumerWidget {
  const MonthPhotosPage({super.key, required this.selectedMonth});
  final String selectedMonth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          colors: const [
            Color.fromARGB(255, 72, 251, 227),
            AppColors.secondary
          ],
          page: MonthPhotos(
            selectedMonth: selectedMonth,
          )),
    );
  }
}
