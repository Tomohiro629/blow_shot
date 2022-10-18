import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Image {
  final String id;
  final String imageURL;
  final DateTime timeStamp;

  factory Image.createImage({
    required String imageURL,
  }) {
    return Image(
      id: const Uuid().v4(),
      imageURL: imageURL,
      timeStamp: DateTime.now(),
    );
  }
  factory Image.fromJson(Map<String, dynamic> map) {
    return Image(
      id: map['id'],
      imageURL: map['imageURL'],
      timeStamp: (map['timeStamp'] as Timestamp).toDate(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageURL': imageURL,
      'timeStamp': timeStamp,
    };
  }

  Image({required this.id, required this.imageURL, required this.timeStamp});
}
