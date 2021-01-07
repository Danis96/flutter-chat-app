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

AlertStyle alertStyle = AlertStyle(
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

Future<bool> commonMyAlert({
  @required BuildContext context,
  @required String title,
  @required Function buttonFunction,
}) {
  return Alert(
    context: context,
    style: alertStyle,
    // type: AlertType.,
    title: title,
    // ignore: always_specify_types
    buttons: [
      DialogButton(
        child: const Text(
          'OK',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onPressed: () => buttonFunction(),
        color: ColorHelper.walletPurple.color,
        radius: BorderRadius.circular(8.0),
      ),
    ],
  ).show();
}
