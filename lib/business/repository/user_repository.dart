import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../firestore/firestore_path.dart';
import '../model/user_model.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository();
});

class UserRepository {
  final _firestore = FirebaseFirestore.instance;

  Stream<User?> fetchUserStream(String userId) {
    final snapshot =
        _firestore.collection(userPath(userId)).doc(userId).snapshots();

    return snapshot
        .map((doc) => doc.data() != null ? User.fromJson(doc.data()!) : null);
  }

  Future<void> setUser(User user) async {
    await _firestore
        .collection(userPath(user.userId))
        .doc(user.userId)
        .set(user.toJson(), SetOptions(merge: true));
  }
}
