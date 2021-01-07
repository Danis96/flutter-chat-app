import 'package:flutter/material.dart';
import 'package:wallet/app/utils/color_helper.dart';

Widget cardScreeen() {
  return Container(
    child: Row(
      children: <Widget>[
        Container(
          height: 40,
          width: 50,
          decoration: BoxDecoration(
            color: ColorHelper.walletBlue.color,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ],
    ),
  );
}
