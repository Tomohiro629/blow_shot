import 'package:blow_shot/service/common_method.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Photo {
  final String id;
  final String userId;
  final String imageURL;
  final String dateTime;
  final DateTime timeStamp;

  factory Photo.createPhoto({
    required String userId,
    required String imageURL,
  }) {
    return Photo(
      id: const Uuid().v4(),
      userId: userId,
      imageURL: imageURL,
      dateTime: getMonthString(DateTime.now()),
      timeStamp: DateTime.now(),
    );
  }
  factory Photo.fromJson(Map<String, dynamic> map) {
    return Photo(
      id: map['id'],
      userId: map['userId'],
      imageURL: map['imageURL'],
      dateTime: map['dateTime'],
      timeStamp: (map['timeStamp'] as Timestamp).toDate(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'imageURL': imageURL,
      'dateTime': dateTime,
      'timeStamp': timeStamp,
    };
  }

  Photo(
      {required this.id,
      required this.userId,
      required this.imageURL,
      required this.dateTime,
      required this.timeStamp});
}
