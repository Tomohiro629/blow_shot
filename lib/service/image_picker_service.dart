import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final imagePickerServiceProvider =
    ChangeNotifierProvider<ImagePickerService>((ref) {
  return ImagePickerService(ref.read);
});

class ImagePickerService extends ChangeNotifier {
  final Reader reader;
  ImagePickerService(this.reader);
  final _picker = ImagePicker();
  File? imagePath;

  Future<void> takeCamera() async {
    final picekdfile =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 80);
    if (picekdfile != null) {
      File? img = File(picekdfile.path);

      imagePath = img;
    }
    notifyListeners();
  }
}
