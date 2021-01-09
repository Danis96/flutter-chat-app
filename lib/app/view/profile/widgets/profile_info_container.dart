import 'package:flutter/material.dart';
import 'package:wallet/app/utils/color_helper.dart';
import 'package:wallet/app/utils/size_config.dart';

Widget infoContainer({String headText, String text, String additionalInfo}) {
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
              fontSize: 22,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 8.0),
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

Widget headerUpdate() {
  return Container(
    padding: const EdgeInsets.all(8.0),
    child: CircleAvatar(
      radius: 120.0,
      backgroundColor: ColorHelper.chatRed.color,
      backgroundImage: NetworkImage(
        'https://i.pinimg.com/originals/36/43/e7/3643e7e8dab9b88b3972ee1c9f909dea.jpg',
      ),
    ),
  );
}
