import 'dart:ui';

import 'package:flutter/material.dart';

enum ColorHelper {
  walletWhite,
  walletBlack,
  walletPurple,
  walletGreenLight,
  walletGrey,
  walletBlue,
}

extension ColorExtension on ColorHelper {
  Color get color {
    switch (this) {
      case ColorHelper.walletWhite:
        return Colors.white;
      case ColorHelper.walletBlack:
        return Colors.black;
      case ColorHelper.walletPurple:
        return const Color.fromRGBO(74, 73, 120, 1.0);
      case ColorHelper.walletGreenLight:
        return const Color.fromRGBO(35, 195, 143, 1.0);
      case ColorHelper.walletGrey:
        return const Color.fromRGBO(176, 176, 183, 1.0);
      case ColorHelper.walletBlue:
        return const Color.fromRGBO(45, 103, 230, 1.0);
    }
    return Colors.white;
  }
}
