import 'package:flutter/material.dart';
import 'package:wallet/app/utils/color_helper.dart';

Widget chatSingleCard() {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Material(
              color: ColorHelper.chatBlack.color,
              elevation: 20,
              borderRadius: BorderRadius.circular(40.0),
              child: CircleAvatar(
                  radius: 30.0,
                  backgroundColor: ColorHelper.chatBlack.color,
                  backgroundImage: const NetworkImage(
                      'https://cdn.shopify.com/s/files/1/0170/5859/4880/files/kennyOverlay_4187252f-a636-4aa2-a28e-42e6916b144b_1980x.png?v=1580502430')),
            ),
            //
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Kenny Kenny',
                    style: TextStyle(
                      color: ColorHelper.walletWhite.color,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Hey fatboy you there?',
                    style: TextStyle(
                      color: ColorHelper.walletGrey.color,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '12:35',
                    style: TextStyle(
                      color: ColorHelper.walletWhite.color,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '100',
                    style: TextStyle(
                      color: ColorHelper.walletGrey.color,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Divider(
            color: ColorHelper.walletGrey.color,
          ),
        ),
      ],
    ),
  );
}
