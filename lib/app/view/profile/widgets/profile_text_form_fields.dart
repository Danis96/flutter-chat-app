import 'package:flutter/material.dart';
import 'package:wallet/app/utils/color_helper.dart';
import 'package:wallet/common/common_empty_container.dart';
import 'package:wallet/common/common_text_form_field.dart';

Widget emailUpdateTextFormField({
  @required TextEditingController controller,
  bool obscureText = false,
  bool readOnly = false,
}) {
  return commonTextFormField(
    controller: controller,
    obscureText: obscureText,
    icon: commonEmptyContainer(),
    hintText: 'Email',
    hintColor: ColorHelper.walletWhite.color,
    readOnly: readOnly,
  );
}

Widget nameUpdateTextFormField({
  @required TextEditingController controller,
  bool obscureText = false,
}) {
  return commonTextFormField(
    controller: controller,
    obscureText: obscureText,
    icon: commonEmptyContainer(),
    hintText: 'Full Name',
    hintColor: ColorHelper.walletWhite.color,
  );
}
