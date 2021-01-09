import 'package:flutter/material.dart';
import 'package:wallet/app/utils/color_helper.dart';
import 'package:wallet/app/utils/size_config.dart';

Widget profileImageContainer() {
  return Container(
    margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 7),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Material(
          color: ColorHelper.chatBlack.color,
          elevation: 20,
          borderRadius: BorderRadius.circular(40.0),
          child: CircleAvatar(
            radius: 60.0,
            backgroundColor: ColorHelper.chatRed.color,
            backgroundImage: const NetworkImage(
                'https://i.pinimg.com/originals/36/43/e7/3643e7e8dab9b88b3972ee1c9f909dea.jpg'),
          ),
        ),
      ],
    ),
  );
}
