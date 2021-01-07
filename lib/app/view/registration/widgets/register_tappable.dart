import 'package:flutter/material.dart';
import 'package:wallet/app/utils/color_helper.dart';
import 'package:wallet/common/common_tappable_text.dart';

Widget registerTappable({Function(int) onPressed}) {
  return TappableText(
    text: 'Already have a account? Login',
    links: 'Login',
    onPressed: onPressed,
    linkStyle: TextStyle(
      color: ColorHelper.walletBlack.color,
    ),
  );
}
