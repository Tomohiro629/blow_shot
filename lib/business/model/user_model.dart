import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String userId;
  final String userName;
  final String userImage;
  final DateTime timeStamp;

  factory User.createUser({
    required String userId,
    required String userName,
    required String userImage,
  }) {
    return User(
        userId: userId,
        userName: userName,
        userImage: userImage,
        timeStamp: DateTime.now());
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      userId: map['userId'],
      userName: map['userName'],
      userImage: map['userImage'],
      timeStamp: (map['timeStamp'] as Timestamp).toDate(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
    };
  }

  User({
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.timeStamp,
  });
}
