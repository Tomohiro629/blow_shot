import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../service/cloud_storage_service.dart';
import '../../../service/image_picker_service.dart';
import '../../components/app_colors.dart';
import '../blow_shot_view_model.dart';

class BlowShotButton extends ConsumerWidget {
  const BlowShotButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storageService = ref.watch(storageServiceProvider);
    final imagePicker = ref.watch(imagePickerServiceProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
          child: Icon(
            Icons.photo_camera_outlined,
            color: AppColors.primary,
            size: 260.sp,
          ),
          onPressed: () async {
            showGeneralDialog(
                context: context,
                barrierColor: Colors.black.withOpacity(0.5),
                pageBuilder:
                    (BuildContext context, animation, secondaryAnimation) {
                  return Center(
                    child: Stack(
                      children: const [
                        CircularProgressIndicator(),
                      ],
                    ),
                  );
                });

            await imagePicker.takeCamera();

            if (imagePicker.imagePath != null) {
              await storageService.uploadPostImageAndGetUrl(
                  file: imagePicker.imagePath!);
              ref.watch(blowShotViewModel).setPhoto(storageService.imageURL);
            }
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
          },
        ),
        Text(
          "一撃で決めろ！",
          style: TextStyle(fontSize: 40.sp),
        )
      ],
    );
  }
}
