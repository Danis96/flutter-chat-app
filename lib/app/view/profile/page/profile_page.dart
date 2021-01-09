import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/app/providers/auth_provider.dart';
import 'package:wallet/app/utils/color_helper.dart';
import 'package:wallet/app/utils/size_config.dart';
import 'package:wallet/app/view/profile/widgets/profile_app_bar.dart';
import 'package:wallet/app/view/profile/widgets/profile_buttons.dart';
import 'package:wallet/app/view/profile/widgets/profile_image_container.dart';
import 'package:wallet/app/view/profile/widgets/profile_info_container.dart';
import 'package:wallet/common/common_alert_dialog.dart';

class ProfilePage extends StatelessWidget {
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
          onPressed: () => commonMyAlert(
            context: context,
            title: 'Are you sure you want to logout from Chats?',
            buttonFunction: () => authProvider.logoutUser(context),
            type: TypeALert.info,
            buttonFunctionCancel: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            profileImageContainer(),
            infoContainer(
              headText: 'Hello',
              text: authProvider.userModel.name,
            ),
            infoContainer(
              headText: 'You are currently registered with',
              // text: authProvider.userModel.email,
              text: authProvider.userModel.lastMessageTime,
            ),
            Container(
              margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 8),
              child: Text(
                'You can edit your profile by clicking on edit icon in the app bar',
                style: TextStyle(
                  color: ColorHelper.walletWhite.color,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
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
