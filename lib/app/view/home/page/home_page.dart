import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/app/providers/auth_provider.dart';
import 'package:wallet/app/utils/color_helper.dart';
import 'package:wallet/app/utils/shared_preffs.dart';
import 'package:wallet/app/utils/size_config.dart';
import 'package:wallet/app/view/home/widgets/home_app_bar.dart';
import 'package:wallet/app/view/home/widgets/home_chat_single_card.dart';

import '../../../utils/color_helper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _getInitialData();
    super.initState();
  }

  Future<void> _getInitialData() async {
    await SharedPreffs().readEmailFromShared().then(
          (String email) => Provider.of<AuthProvider>(context, listen: false)
              .getUserDataByEmail(email: email, isLogin: false),
        );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorHelper.chatBlack.color,
      appBar: homeAppBar(
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView.builder(
          itemCount: 24,
          itemBuilder: (BuildContext context, int index) {
            return chatSingleCard();
          },
        ),
      ),
    );
  }
}
