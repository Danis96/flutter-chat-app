import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/app/models/user_model.dart';
import 'package:wallet/app/providers/auth_provider.dart';
import 'package:wallet/app/providers/messages_provider.dart';
import 'package:wallet/app/utils/color_helper.dart';
import 'package:wallet/app/view/chatroom/widgets/chatroom_app_bar.dart';
import 'package:wallet/app/view/chatroom/widgets/chatroom_messages_widget.dart';
import 'package:wallet/app/view/chatroom/widgets/chatroom_text_form_field.dart';

class ChatroomPage extends StatelessWidget {
  ChatroomPage({this.user});

  final UserModel user;

  final TextEditingController _msgController = TextEditingController();

  final GlobalKey<FormState> _chatFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final MessagesProvider messagesProvider =
        Provider.of<MessagesProvider>(context, listen: true);

    final UserModel userCurrent =
        Provider.of<AuthProvider>(context, listen: true).userModel;

    return Scaffold(
      backgroundColor: ColorHelper.chatBlack.color,
      appBar: chatroomAppBar(
        name: user.name,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            MessagesWidget(
              currentuserID: userCurrent.uid,
              senderID: user.uid,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Form(
                    key: _chatFormKey,
                    child: chatroomTextFormField(
                      controller: _msgController,
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    left: 5,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.send,
                      color: ColorHelper.chatRed.color,
                    ),
                    onPressed: () {
                      if (_msgController.text.isEmpty) {
                        print("It's empty!");
                      } else {
                        FocusScope.of(context).unfocus();
                        messagesProvider.uploadMessage(
                          controller: _msgController,
                          username: userCurrent.name,
                          senderID: userCurrent.uid,
                          userID: user.uid,
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
