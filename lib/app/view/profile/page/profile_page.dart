import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/app/providers/auth_provider.dart';
import 'package:wallet/app/utils/color_helper.dart';
import 'package:wallet/app/utils/size_config.dart';
import 'package:wallet/app/view/profile/widgets/profile_app_bar.dart';
import 'package:wallet/app/view/profile/widgets/profile_buttons.dart';
import 'package:wallet/app/view/profile/widgets/profile_image_container.dart';
import 'package:wallet/app/view/profile/widgets/profile_info_container.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    Provider.of<AuthProvider>(context, listen: false).readPreffs();
    Provider.of<AuthProvider>(context, listen: false).getUserByID();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: ColorHelper.chatBlack.color,
      appBar: profileAppBar(
        context: context,
        userModel: authProvider,
      ),
      bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 6),
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: profileLogoutButton(
            authProvider: authProvider,
            context: context,
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            profileImageContainer(),
            infoContainer(headText: 'Name', text: authProvider.userName),
            infoContainer(headText: 'Email', text: authProvider.userEmail),
            Container(
              margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 7),
              child: Divider(
                color: ColorHelper.chatRed.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
