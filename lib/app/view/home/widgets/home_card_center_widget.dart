import 'package:flutter/material.dart';
import 'package:wallet/app/utils/color_helper.dart';
import 'package:wallet/app/utils/size_config.dart';

Widget transactionCenterWidget() {
  return Center(
    child: Container(
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 30),
      height: SizeConfig.blockSizeVertical * 10,
      width: SizeConfig.blockSizeHorizontal * 90,
      decoration: BoxDecoration(
          color: ColorHelper.walletWhite.color,
          border: Border.all(
            color: ColorHelper.walletBlue.color,
          ),
          borderRadius: BorderRadius.circular(8.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 40),
            child: Image.asset(
              'assets/cart.png',
              width: 50,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: const Text(
                    'Last purchase',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: const <Widget>[
                      Text(
                        'BAM  ',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '2234.42',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: const Text('02 Jan 15:34',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget cardCenterWidget() {
  return Center(
    child: Container(
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 28),
      height: SizeConfig.blockSizeVertical * 22,
      width: SizeConfig.blockSizeHorizontal * 90,
      decoration: BoxDecoration(
        color: ColorHelper.walletBlue.color,
        border: Border.all(
          color: ColorHelper.walletWhite.color,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'BAM  ',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: ColorHelper.walletWhite.color,
                    ),
                  ),
                  Text(
                    '424.56',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: ColorHelper.walletWhite.color,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              '**** **** **** 5739',
              style: TextStyle(
                fontSize: 18.0,
                color: ColorHelper.walletWhite.color.withOpacity(0.7),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Expires\n9/21 ',
              style: TextStyle(
                fontSize: 16.0,
                color: ColorHelper.walletWhite.color.withOpacity(0.7),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
