import 'package:flutter/material.dart';
import 'package:wallet/common/common_button.dart';

Widget registerButton({
  @required Function onPressed,
}) {
  return commonButton(
    onPressed: onPressed,
    text: 'Create account',
  );
}
