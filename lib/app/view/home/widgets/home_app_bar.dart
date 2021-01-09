import 'package:flutter/material.dart';
import 'package:wallet/common/common_empty_container.dart';
import 'package:wallet/routing/routes.dart';

import '../../../../common/common_app_bar.dart';
import '../../../utils/color_helper.dart';

PreferredSizeWidget homeAppBar({
  BuildContext context,
}) {
  return commonAppBar(
    title: 'Chats',
    centerTitle: false,
    backgroundColor: ColorHelper.chatBlack.color,
    elevation: 0,
    leading: GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(Profile),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius: 30.0,
          backgroundColor: ColorHelper.chatRed.color,
          backgroundImage: NetworkImage(
            'https://i.pinimg.com/originals/36/43/e7/3643e7e8dab9b88b3972ee1c9f909dea.jpg',
          ),
        ),
      ),
    ),
    action: commonEmptyContainer(),
  );
}
