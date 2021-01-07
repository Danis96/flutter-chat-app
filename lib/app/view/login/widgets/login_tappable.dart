import 'package:flutter/material.dart';
import 'package:wallet/app/utils/color_helper.dart';
import 'package:wallet/common/common_tappable_text.dart';

Widget loginTappable({Function(int) onPressed}) {
  return TappableText(
    text: "Don't have account? Create a new account",
    links: 'Create a new account',
    onPressed: onPressed,
    linkStyle: TextStyle(
      color: ColorHelper.walletPurple.color,
    ),
  );
}
