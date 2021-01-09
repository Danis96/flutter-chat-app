import 'package:flutter/material.dart';
import 'package:wallet/app/providers/auth_provider.dart';
import 'package:wallet/app/utils/color_helper.dart';
import 'package:wallet/common/common_app_bar.dart';

PreferredSizeWidget profileAppBar({
  BuildContext context,
  AuthProvider userModel,
}) {
  return commonAppBar(
    backgroundColor: ColorHelper.chatBlack.color,
    title: 'Hi ${userModel.userModel.name} ',
    action: IconButton(
      icon: Icon(Icons.edit),
      onPressed: () => print('Go to edit profile'),
    ),
  );
}
