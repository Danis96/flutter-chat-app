import 'package:flutter/material.dart';
import 'package:wallet/app/providers/auth_provider.dart';
import 'package:wallet/app/utils/color_helper.dart';
import 'package:wallet/common/common_app_bar.dart';
import 'package:wallet/common/common_empty_container.dart';
import 'package:wallet/routing/routes.dart';

PreferredSizeWidget profileAppBar({
  BuildContext context,
  AuthProvider userModel,
}) {
  return commonAppBar(
    backgroundColor: ColorHelper.chatBlack.color,
    title: 'Hi ${userModel.userModel.name} ',
    action: IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () => Navigator.of(context).pushNamed(ProfileUpdate),
    ),
  );
}

PreferredSizeWidget profileUpdateAppBar() {
  return commonAppBar(
    title: 'Edit profile',
    centerTitle: false,
    action: commonEmptyContainer(),
    elevation: 0,
    backgroundColor: ColorHelper.chatBlack.color,
  );
}
