import 'package:blow_shot/service/common_method.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../business/model/photo_model.dart';
import '../../business/repository/photo_repository.dart';
import '../../service/auth_service.dart';

final monthPhotosViewModelProvider =
    ChangeNotifierProvider<MonthPhotosViewModel>((ref) {
  return MonthPhotosViewModel(ref.read);
});

class MonthPhotosViewModel extends ChangeNotifier {
  final Reader reader;
  MonthPhotosViewModel(this.reader);

  Stream<List<Photo>> fetchDayPhotoStream(selectedDay) {
    final userId = reader(authServiceProvider).userId;
    return reader(photoRepositoryProvider)
        .fetchDayPhotoStream(userId: userId, today: selectedDay);
  }

  Future<Photo?> getSelectedDayPhoto(selectedDay) {
    final userId = reader(authServiceProvider).userId;
    return reader(photoRepositoryProvider)
        .getSlectedDayPhoto(userId: userId, selectedDay: selectedDay);
  }

  Query<Photo> queryTodayPhotos(selectedMonth) {
    final userId = reader(authServiceProvider).userId;
    final now = DateTime.now();
    return reader(photoRepositoryProvider).queryTodayPhotos(
        userId: userId, today: "$selectedMonth${getDayString(now)}日");
  }
}
