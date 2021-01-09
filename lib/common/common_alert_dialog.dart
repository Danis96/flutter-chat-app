import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:wallet/app/utils/color_helper.dart';

Future<void> showMyDialog({
  BuildContext context,
  String title,
  String msg,
  Color color,
  Widget mainWidget,
  Widget action,
  double elevation,
  bool barrier,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: barrier,
    builder: (BuildContext context) {
      return AlertDialog(
        elevation: 0,
        backgroundColor: color,
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Container(
                child: mainWidget,
              )
            ],
          ),
        ),
        actions: <Widget>[
          action,
        ],
      );
    },
  );
}

AlertStyle alertStyleError = AlertStyle(
  animationType: AnimationType.fromTop,
  isCloseButton: false,
  isOverlayTapDismiss: false,
  animationDuration: const Duration(milliseconds: 400),
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
    side: const BorderSide(
      color: Colors.grey,
    ),
  ),
  titleStyle: const TextStyle(
    color: Colors.red,
  ),
  alertAlignment: Alignment.center,
);

AlertStyle alertStyleInfo = AlertStyle(
  animationType: AnimationType.grow,
  isCloseButton: false,
  isOverlayTapDismiss: false,
  animationDuration: const Duration(milliseconds: 500),
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
    side: const BorderSide(
      color: Colors.grey,
    ),
  ),
  titleStyle: TextStyle(
    color: ColorHelper.chatBlack.color,
  ),
  alertAlignment: Alignment.center,
);

enum TypeALert {
  error,
  success,
  info,
}

Future<bool> commonMyAlert({
  @required BuildContext context,
  @required String title,
  @required Function buttonFunction,
  @required Function buttonFunctionCancel,
  TypeALert type = TypeALert.error,
}) {
  return Alert(
    context: context,
    style: type == TypeALert.error ? alertStyleError : alertStyleInfo,
    title: title,
    // ignore: always_specify_types
    buttons: type == TypeALert.error
        ? [
            DialogButton(
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () => buttonFunction(),
              color: type == TypeALert.error
                  ? ColorHelper.chatRed.color
                  : ColorHelper.walletGreenLight.color,
              radius: BorderRadius.circular(8.0),
            )
          ]
        : [
            DialogButton(
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () => buttonFunctionCancel(),
              color: type == TypeALert.error
                  ? ColorHelper.chatRed.color
                  : ColorHelper.walletGreenLight.color,
              radius: BorderRadius.circular(8.0),
            ),
            DialogButton(
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () => buttonFunction(),
              color: type == TypeALert.error
                  ? ColorHelper.chatRed.color
                  : ColorHelper.walletGreenLight.color,
              radius: BorderRadius.circular(8.0),
            ),
          ],
  ).show();
}
