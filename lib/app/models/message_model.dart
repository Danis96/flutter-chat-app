import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  MessageModel({
    this.createdAt,
    this.message,
    this.urlAvatar,
    this.userID,
    this.username,
  });

  factory MessageModel.fromDocument(Map<String, dynamic> doc) {
    return MessageModel(
      createdAt: doc['created_at'] as Timestamp,
      userID: doc['id_user'] as String ?? '',
      message: doc['message'] as String ?? '',
      urlAvatar: doc['url_avatar'] as String ?? '',
      username: doc['username'] as String ?? '',
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'created_at': createdAt,
        'id_user': userID ?? '',
        'message': message ?? '',
        'url_avatar': urlAvatar,
        'username': username ?? ''
      };

  Timestamp createdAt;
  String userID;
  String message;
  String urlAvatar;
  String username;
}
