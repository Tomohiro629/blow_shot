import 'package:blow_shot/app/blow_shot_page/blow_shot_view_model.dart';
import 'package:blow_shot/app/components/app_colors.dart';
import 'package:blow_shot/app/components/page_back_ground.dart';
import 'package:blow_shot/service/cloud_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../service/image_cropper_service.dart';
import '../../service/image_picker_service.dart';

class BlowShotPage extends ConsumerWidget {
  const BlowShotPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(blowShotViewModel);
    final storageService = ref.watch(storageServiceProvider);
    final imagePicker = ref.watch(imagePickerServiceProvider);
    final croppedImage = ref.watch(imageCropperServiceProvider);

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
              ),
            ),
            Center(
                child: imagePicker.imagePath == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            child: Icon(
                              Icons.photo_camera_outlined,
                              color: AppColors.primary,
                              size: 300.sp,
                            ),
                            onPressed: () async {
                              imagePicker.takeCamera();
                              if (imagePicker.imagePath != null) {
                                croppedImage.cropImage(
                                    imageFile: imagePicker.imagePath!);
                              }
                              viewModel.setPhoto(storageService.imageURL);
                            },
                          ),
                          Text(
                            "一撃で決めろ！",
                            style: TextStyle(fontSize: 40.sp),
                          )
                        ],
                      )
                    : Center(
                        child: Column(
                          children: const [
                            CircularProgressIndicator(),
                            Text("問答無用で保存！"),
                          ],
                        ),
                      )),
          ],
        ),
      ),
    );
  }
}
