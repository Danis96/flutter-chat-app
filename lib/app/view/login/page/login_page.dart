import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/app/providers/auth_provider.dart';
import 'package:wallet/app/utils/shared_preffs.dart';
import 'package:wallet/app/view/login/widgets/login_button.dart';
import 'package:wallet/app/view/login/widgets/login_logo_headline.dart';
import 'package:wallet/app/view/login/widgets/login_tappable.dart';
import 'package:wallet/app/view/login/widgets/login_text_form_fields.dart';
import 'package:wallet/common/common_alert_dialog.dart';
import 'package:wallet/common/common_loader.dart';
import 'package:wallet/routing/routes.dart';

import '../../../utils/color_helper.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final AuthProvider _authProvider =
        Provider.of<AuthProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: ColorHelper.chatBlack.color,
      body: WillPopScope(
        onWillPop: () => null,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ListView(
              // physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                logoHeadline(),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: Form(
                    key: _loginFormKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: emailTextFormField(
                            controller: _emailController,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: passwordTextFormField(
                            controller: _passwordController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 80),
                  child: loginButton(
                    onPressed: () => loginUser(
                      authProvider: _authProvider,
                      context: context,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: loginTappable(
                    onPressed: (int onPress) =>
                        Navigator.of(context).pushNamed(SignUp),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// checking local validation
  /// then send login request,
  /// then navigate to home,
  /// if false local validation show local errors,
  /// if false login request show modal with parsed error
  void loginUser({
    BuildContext context,
    AuthProvider authProvider,
  }) {
    loaderDialog(context: context);
    final FormState _formState = _loginFormKey.currentState;
    if (_formState.validate()) {
      authProvider
          .loginUser(
        email: _emailController.text,
        password: _passwordController.text,
      )
          .then(
        (_) {
          if (authProvider.loginErrorMsg != null) {
            Navigator.of(context).pop();
            commonMyAlert(
              context: context,
              title: authProvider.loginErrorMsg,
              buttonFunction: () => Navigator.of(context).pop(),
            );
          } else {
            SharedPreffs().writeEmailInShared(_emailController.text);
            Navigator.of(context).pop();
            Navigator.of(context).pushNamedAndRemoveUntil(
              Home,
              (_) => false,
            );
          }
        },
      );
    } else {
      Navigator.of(context).pop();
    }
  }
}
