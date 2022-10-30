import 'package:blow_shot/app/month_photos_page/widgets/month_photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
