import 'package:flutter/material.dart';
import 'package:wallet/app/utils/color_helper.dart';
import 'package:wallet/app/utils/size_config.dart';

Widget infoContainer({String headText, String text}) {
  return Container(
    margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            headText ?? '',
            style: TextStyle(
              color: ColorHelper.walletWhite.color,
              fontWeight: FontWeight.w200,
              fontSize: 26,
            ),
          ),
        ),
        Container(
          child: Text(
            text ?? '',
            style: TextStyle(
              color: ColorHelper.walletWhite.color,
              fontWeight: FontWeight.w400,
              fontSize: 22,
            ),
          ),
        ),
      ],
    ),
  );
}
