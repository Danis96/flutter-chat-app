import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/app/models/message_model.dart';
import 'package:wallet/app/providers/messages_provider.dart';

import 'chatroom_new_msg_widget.dart';

class MessagesWidget extends StatefulWidget {
  const MessagesWidget({this.currentuserID, this.senderID});

  final String senderID;
  final String currentuserID;

  @override
  _MessagesWidgetState createState() => _MessagesWidgetState();
}

class _MessagesWidgetState extends State<MessagesWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<MessagesProvider>(
      context,
      listen: false,
    ).getMessages(
      idUser: widget.currentuserID,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<MessageModel> messages =
        Provider.of<MessagesProvider>(context, listen: true).messages;

    return Expanded(
      child: ListView.builder(
        itemCount: messages.length ?? 0,
        physics: const BouncingScrollPhysics(),
        reverse: true,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          final MessageModel msg = messages[index];
          return messageWidget(
            message: msg,
            isMe: msg.userID == widget.currentuserID,
            context: context,
          );
        },
      ),
    );
  }
}
