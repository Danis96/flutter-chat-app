import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/app/providers/auth_provider.dart';
import 'package:wallet/app/utils/color_helper.dart';
import 'package:wallet/app/utils/size_config.dart';
import 'package:wallet/app/view/profile/widgets/profile_app_bar.dart';
import 'package:wallet/app/view/profile/widgets/profile_buttons.dart';
import 'package:wallet/app/view/profile/widgets/profile_info_container.dart';
import 'package:wallet/app/view/profile/widgets/profile_text_form_fields.dart';
import 'package:wallet/common/common_alert_dialog.dart';
import 'package:wallet/common/common_loader.dart';

class ProfileUpdatePage extends StatefulWidget {
  @override
  _ProfileUpdatePageState createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final GlobalKey<FormState> _updateFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Provider.of<AuthProvider>(context, listen: false).getInitialUserData(
      emailController: _emailController,
      nameController: _nameController,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final AuthProvider authProvider = Provider.of(context, listen: true);

    Future<void> onUpdatePressed() async {
      loaderDialog(context: context);
      final FormState form = _updateFormKey.currentState;
      if (form.validate()) {
        await authProvider
            .updateUser(
          email: _emailController.text,
          name: _nameController.text,
          userID: authProvider.userModel.uid,
        )
            .then((_) {
          if (authProvider.updateUserErrorMsg != null) {
            Navigator.of(context).pop();
            commonMyAlert(
              context: context,
              title: authProvider.updateUserErrorMsg,
              buttonFunction: () => Navigator.of(context).pop(),
            );
          } else {
            Navigator.of(context).pop();
            commonMyAlert(
              context: context,
              title: 'User is successfully updated!',
              buttonFunction: () => Navigator.of(context).pop(),
            );
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: ColorHelper.chatBlack.color,
      appBar: profileUpdateAppBar(),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 6),
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: updateProfileButton(
          onPressed: () => onUpdatePressed(),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children: <Widget>[
              headerUpdate(),
              Divider(
                color: ColorHelper.chatRed.color,
              ),
              Container(
                margin: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical * 5,
                ),
                child: Form(
                  key: _updateFormKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: emailUpdateTextFormField(
                          controller: _emailController,
                          readOnly: true,
                        ),
                      ),
                      Container(
                        child: nameUpdateTextFormField(
                          controller: _nameController,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
