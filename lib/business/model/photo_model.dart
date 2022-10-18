import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Photo {
  final String id;
  final String userId;
  final String imageURL;
  final DateTime timeStamp;

  factory Photo.createPhoto({
    required String userId,
    required String imageURL,
  }) {
    return Photo(
      id: const Uuid().v4(),
      userId: userId,
      imageURL: imageURL,
      timeStamp: DateTime.now(),
    );
  }
  factory Photo.fromJson(Map<String, dynamic> map) {
    return Photo(
      id: map['id'],
      userId: map['userId'],
      imageURL: map['imageURL'],
      timeStamp: (map['timeStamp'] as Timestamp).toDate(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'imageURL': imageURL,
      'timeStamp': timeStamp,
    };
  }

  Photo(
      {required this.id,
      required this.userId,
      required this.imageURL,
      required this.timeStamp});
}
