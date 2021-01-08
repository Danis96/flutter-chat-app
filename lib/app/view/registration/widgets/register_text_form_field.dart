import 'package:flutter/material.dart';
import 'package:wallet/app/utils/color_helper.dart';
import 'package:wallet/common/common_empty_container.dart';
import 'package:wallet/common/common_text_form_field.dart';

Widget emailRegisterTextFormField({
  @required TextEditingController controller,
  bool obscureText = false,
}) {
  return commonTextFormField(
    controller: controller,
    obscureText: obscureText,
    icon: commonEmptyContainer(),
    hintText: 'Email',
    hintColor: ColorHelper.walletWhite.color,
  );
}

Widget passwordRegisterTextFormField({
  @required TextEditingController controller,
  bool obscureText = false,
}) {
  return PasswordTextFormField(
    obscureText: true,
    controller: controller,
    icon: commonEmptyContainer(),
    hintText: 'Password',
    hintColor: ColorHelper.walletWhite.color,
  );
}

Widget confirmPasswordRegisterTextFormField({
  @required TextEditingController controller,
  bool obscureText = false,
}) {
  return PasswordTextFormField(
    obscureText: true,
    controller: controller,
    icon: commonEmptyContainer(),
    hintText: 'Confirm Password',
    hintColor: ColorHelper.walletWhite.color,
  );
}
