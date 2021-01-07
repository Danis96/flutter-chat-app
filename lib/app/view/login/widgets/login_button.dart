import 'package:flutter/material.dart';
import 'package:wallet/common/common_button.dart';

Widget loginButton({
  @required Function onPressed,
}) {
  return commonButton(
    onPressed: onPressed,
    text: 'Login',
  );
}
