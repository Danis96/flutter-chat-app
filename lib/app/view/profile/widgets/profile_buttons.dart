import 'package:flutter/material.dart';
import 'package:wallet/common/common_button.dart';

Widget profileLogoutButton({@required Function onPressed}) {
  return commonButton(
    onPressed: () => onPressed(),
    text: 'Logout',
  );
}

Widget updateProfileButton({
  @required Function onPressed,
}) {
  return Container(
    child: commonButton(
      onPressed: () => onPressed(),
      text: 'Update profile',
    ),
  );
}
