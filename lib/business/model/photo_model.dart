import 'package:blow_shot/service/common_method.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Photo {
  final String id;
  final String userId;
  final String imageURL;
  final String yyyyMM;
  final String yyyyMMdd;
  final DateTime timeStamp;

  factory Photo.createPhoto({
    required String userId,
    required String imageURL,
  }) {
    return Photo(
      id: const Uuid().v4(),
      userId: userId,
      imageURL: imageURL,
      yyyyMM:
          "${getYearString(DateTime.now())}年${getMonthString(DateTime.now())}月",
      //2022年〇月表記で保存
      yyyyMMdd: getDateString(DateTime.now()),
      timeStamp: DateTime.now(),
    );
  }
  factory Photo.fromJson(Map<String, dynamic> map) {
    return Photo(
      id: map['id'],
      userId: map['userId'],
      imageURL: map['imageURL'],
      yyyyMM: map['yyyyMM'],
      yyyyMMdd: map['yyyyMMdd'],
      timeStamp: (map['timeStamp'] as Timestamp).toDate(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'imageURL': imageURL,
      'yyyyMM': yyyyMM,
      'yyyyMMdd': yyyyMMdd,
      'timeStamp': timeStamp,
    };
  }

  Photo(
      {required this.id,
      required this.userId,
      required this.imageURL,
      required this.yyyyMM,
      required this.yyyyMMdd,
      required this.timeStamp});
}
