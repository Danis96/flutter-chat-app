import 'package:flutter/material.dart';
import 'package:wallet/app/utils/color_helper.dart';

enum ButtonType {
  fullButton,
  bottomButton,
}

Widget commonButton({
  @required Function onPressed,
  String text,
  ButtonType buttonType = ButtonType.fullButton,
}) {
  return Container(
    height: 50,
    child: RaisedButton(
      onPressed: () => onPressed(),
      color: isFullButton(buttonType)
          ? ColorHelper.chatRed.color
          : ColorHelper.walletWhite.color,
      child: isFullButton(buttonType)
          ? Text(
              text.toUpperCase(),
              style: TextStyle(
                color: isFullButton(buttonType)
                    ? ColorHelper.walletWhite.color
                    : ColorHelper.walletPurple.color,
                fontSize: 18,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.add_circle_outline,
                  color: ColorHelper.walletPurple.color,
                  size: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: isFullButton(buttonType)
                          ? ColorHelper.walletWhite.color
                          : ColorHelper.walletPurple.color,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
      shape: RoundedRectangleBorder(
        borderRadius: isFullButton(buttonType)
            ? BorderRadius.circular(6.0)
            : BorderRadius.circular(0.0),
      ),
    ),
  );
}

bool isFullButton(ButtonType type) {
  return type == ButtonType.fullButton;
}
