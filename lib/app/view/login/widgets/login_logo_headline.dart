import 'package:flutter/material.dart';
import 'package:wallet/app/utils/color_helper.dart';


Widget logoHeadline() {
  return Column(
    children: <Widget>[
      Container(
        margin: const EdgeInsets.only(top: 70.0),
        child: Image.asset(
          'assets/wallet.png',
          width: 100,
          height: 100,
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 5.0),
        child: Text(
          'Welcome Back',
          style: TextStyle(
            color: ColorHelper.walletBlack.color,
            fontWeight: FontWeight.w700,
            fontSize: 32,
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 5.0),
        child: Text(
          'Sign to continue',
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
