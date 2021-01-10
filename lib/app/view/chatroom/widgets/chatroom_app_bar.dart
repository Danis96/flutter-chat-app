import 'package:flutter/material.dart';
import 'package:wallet/app/utils/color_helper.dart';
import 'package:wallet/common/common_app_bar.dart';

PreferredSizeWidget chatroomAppBar({
  String name,
}) {
  return commonAppBar(
    title: name ?? '',
    centerTitle: false,
    action: Container(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 30.0,
        backgroundColor: ColorHelper.chatBlack.color,
        backgroundImage: const NetworkImage(
          'https://cdn.shopify.com/s/files/1/0170/5859/4880/files/kennyOverlay_4187252f-a636-4aa2-a28e-42e6916b144b_1980x.png?v=1580502430',
        ),
      ),
    ),
    backgroundColor: ColorHelper.chatBlack.color,
    elevation: 0,
  );
}
