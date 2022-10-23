import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../firestore/firestore_path.dart';
import '../model/photo_model.dart';

final photoRepositoryProvider = Provider<PhotoRepository>((ref) {
  return PhotoRepository();
});

class PhotoRepository {
  final _firestore = FirebaseFirestore.instance;

  Stream<List<Photo>> fetchDayPhotoStream(
      {required String userId, required String today}) {
    final snapshots = _firestore
        .collection(photoPath(userId))
        .where("userId", isEqualTo: userId)
        .where("yyyyMMdd", isEqualTo: today)
        .snapshots();
    return snapshots.map(((qs) => qs.docs.isEmpty
        ? []
        : qs.docs.map((doc) => Photo.fromJson(doc.data())).toList()));
  }

  Query<Photo> queryTodayPhotos(
      {required String userId, required String today}) {
    final query = _firestore
        .collection(photoPath(userId))
        .where("yyyyMMdd", isEqualTo: today)
        .orderBy("timeStamp", descending: false);
    return query.withConverter(
        fromFirestore: (snapshot, _) => Photo.fromJson(snapshot.data()!),
        toFirestore: (photo, _) => photo.toJson());
  }

  Future<void> setPhoto(Photo photo) async {
    await _firestore
        .collection(photoPath(photo.userId))
        .doc(photo.id)
        .set(photo.toJson(), SetOptions(merge: true));
  }
}
