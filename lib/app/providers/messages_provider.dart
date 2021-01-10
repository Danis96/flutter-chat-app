import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wallet/app/models/message_model.dart';

class MessagesProvider extends ChangeNotifier {
  List<MessageModel> _messages = <MessageModel>[];
  List<MessageModel> get messages => _messages;

  final CollectionReference firestoreChats =
      FirebaseFirestore.instance.collection('chats');

  Future<void> getMessages({String idUser}) async {
    try {
      _messages = <MessageModel>[];
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('chats/$idUser/messages')
          .orderBy('created_at', descending: true)
          .get();
      // ignore: avoid_function_literals_in_foreach_calls
      snapshot.docs.forEach(
        (QueryDocumentSnapshot element) => _messages.add(
          MessageModel.fromDocument(
            element.data(),
          ),
        ),
      );
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> uploadMessage({
    @required TextEditingController controller,
    @required String senderID,
    @required String username,
    @required String userID,
  }) async {
    try {
      final CollectionReference refMsg =
          FirebaseFirestore.instance.collection('chats/$userID/messages');
      final MessageModel message = MessageModel(
        createdAt: Timestamp.now(),
        message: controller.text,
        urlAvatar: '',
        userID: senderID,
        username: username,
      );
      await refMsg.add(message.toJson());
      // inform user that he has got the message
      final CollectionReference userThatGetMsg =
          FirebaseFirestore.instance.collection('users');
      await userThatGetMsg.doc(userID).update(
        <String, dynamic>{
          'last_msg_time': Timestamp.now(),
        },
      );
      controller.clear();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
