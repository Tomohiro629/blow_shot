import 'package:blow_shot/business/model/photo_model.dart';
import 'package:blow_shot/business/repository/photo_repository.dart';
import 'package:blow_shot/service/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final blowShotViewModel = ChangeNotifierProvider<BlowShotViewModel>((ref) {
  return BlowShotViewModel(
    ref.read,
  );
});

class BlowShotViewModel extends ChangeNotifier {
  final Reader reader;
  BlowShotViewModel(this.reader);

  Future<void> setPhoto(imageURL) async {
    final photo = Photo.createPhoto(
        userId: reader(authServiceProvider).userId, imageURL: imageURL);
    await reader(photoRepositoryProvider).setPhoto(photo);
    notifyListeners();
  }
}
