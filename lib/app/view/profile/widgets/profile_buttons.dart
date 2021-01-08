import 'package:flutter/material.dart';
import 'package:wallet/app/providers/auth_provider.dart';
import 'package:wallet/common/common_button.dart';

Widget profileLogoutButton({
  AuthProvider authProvider,
  BuildContext context,
}) {
  return commonButton(
      onPressed: () => authProvider.logoutUser(context), text: 'Logout');
}
