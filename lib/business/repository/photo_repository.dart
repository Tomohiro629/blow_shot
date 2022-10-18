import '../model/photo_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final photoRepositoryProvider = Provider<PhotoRepository>((ref) {
  return PhotoRepository();
});

class PhotoRepository {
  final _firestore = FirebaseFirestore.instance;

  Stream<List<Photo>> fetchPhotoStream() {
    final snapshots = _firestore.collection(photoPath()).snapshots();
    return snapshots.map(((qs) => qs.docs.isEmpty
        ? []
        : qs.docs.map((doc) => Photo.fromJson(doc.data())).toList()));
  }

  Future<void> setPhoto(Photo photo) async {
    await _firestore
        .collection(photoPath)
        .doc(photo.id)
        .set(photo.toJson(), SetOptions(merge: true));
  }
}
