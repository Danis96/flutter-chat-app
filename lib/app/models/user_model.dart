import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel({
    this.email,
    this.name,
    this.uid,
    this.firestoreID,
    this.lastMsgTime,
  });

  factory UserModel.fromDocument(Map<String, dynamic> doc) {
    return UserModel(
      email: doc['email'] as String ?? '',
      uid: doc['userID'] as String ?? '',
      name: doc['name'] as String ?? '',
      lastMsgTime: doc['last_msg_time'] as Timestamp,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name ?? '',
        'email': email ?? '',
        'userID': firestoreID ?? '',
        'last_msg_time': lastMsgTime,
        'userToken': uid ?? ''
      };

  String email;
  String name;
  String uid;
  String firestoreID;
  Timestamp lastMsgTime;

  String get lastMessageTime =>
      DateTime.fromMillisecondsSinceEpoch(lastMsgTime.seconds * 1000)
          .toString();
}
