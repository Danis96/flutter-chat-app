import 'package:flutter/material.dart';
import 'package:wallet/app/utils/color_helper.dart';

Widget registerLogoHeadline() {
  return Column(
    children: <Widget>[
      Container(
        margin: const EdgeInsets.only(top: 100.0),
        child: Text(
          'Create Account',
          style: TextStyle(
            color: ColorHelper.walletPurple.color,
            fontWeight: FontWeight.w700,
            fontSize: 32,
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 5.0),
        child: Text(
          'Create a new account',
          style: TextStyle(
            color: ColorHelper.walletGrey.color,
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
      ),
    ],
  );
}
