import 'package:flutter/material.dart';
import 'package:wallet/app/utils/color_helper.dart';

PreferredSizeWidget commonAppBar({
  double elevation,
  Color backgroundColor,
  Widget leading,
  Widget action,
  bool centerTitle = true,
  @required String title,
}) {
  return AppBar(
    backgroundColor: backgroundColor ?? ColorHelper.walletWhite.color,
    elevation: elevation ?? 1,
    centerTitle: centerTitle,
    leading: leading,
    title: Text(
      title,
      style: TextStyle(
        color: ColorHelper.walletWhite.color,
        fontWeight: FontWeight.w600,
        fontSize: 23,
      ),
    ),
    actions: <Widget>[
      action,
    ],
  );
}
