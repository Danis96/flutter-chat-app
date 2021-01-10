import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/app/models/user_model.dart';
import 'package:wallet/app/providers/auth_provider.dart';
import 'package:wallet/app/providers/messages_provider.dart';
import 'package:wallet/app/utils/color_helper.dart';
import 'package:wallet/app/utils/shared_preffs.dart';
import 'package:wallet/app/utils/size_config.dart';
import 'package:wallet/app/view/home/widgets/home_app_bar.dart';
import 'package:wallet/app/view/home/widgets/home_chat_single_card.dart';
import 'package:wallet/common/common_empty_container.dart';
import 'package:wallet/common/common_loader.dart';

import '../../../utils/color_helper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future<void>(() {
      loaderDialog(context: context);
    });
    _getInitialData();
    super.initState();
  }

  Future<void> _getInitialData() async {
    await SharedPreffs().readEmailFromShared().then(
          (String email) => Provider.of<AuthProvider>(context, listen: false)
              .getUserDataByEmail(email: email, isLogin: false),
        );
    Provider.of<AuthProvider>(context, listen: false).fetchUsers();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final UserModel userCurrent =
        Provider.of<AuthProvider>(context, listen: false).userModel;

    final List<UserModel> users =
        Provider.of<AuthProvider>(context, listen: true).usersAll;

    return Scaffold(
      backgroundColor: ColorHelper.chatBlack.color,
      appBar: homeAppBar(
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            final UserModel user = users[index];
            if (user.uid == userCurrent.uid) {
              return commonEmptyContainer();
            } else {
              return chatSingleCard(
                user: user,
                context: context,
              );
            }
          },
        ),
      ),
    );
  }
}
