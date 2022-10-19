import 'package:blow_shot/app/blow_shot_page/widgets/blow_shot_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';

import '../../business/model/photo_model.dart';
import '../components/app_colors.dart';
import '../components/page_back_ground.dart';
import 'blow_shot_view_model.dart';

class BlowShotPage extends ConsumerWidget {
  const BlowShotPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(blowShotViewModel);

    return Scaffold(
      body: PageBackGround(
        colors: const [AppColors.accent, Colors.black],
        page: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 100.0, horizontal: 20.0),
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(175, 255, 255, 255),
                        spreadRadius: 5,
                        offset: Offset(1, 1))
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: FirestoreListView<Photo>(
                  query: viewModel.todayPhotoQuery(),
                  itemBuilder: (context, snapshot) {
                    final photo = snapshot.data();
                    return Column(
                      children: [
                        const BlowShotButton(),
                        Text(photo.timeStamp.toString())
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Center(
//                       child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: snapshot.data!.map((Photo photo) {
//                             return Center(
//                                 child: Text("問答無用で保存！\nまた明日！！",
//                                     style: TextStyle(fontSize: 30.sp)));
//                           })))