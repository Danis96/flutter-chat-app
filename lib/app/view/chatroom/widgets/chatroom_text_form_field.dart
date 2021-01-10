import 'package:flutter/material.dart';
import 'package:wallet/app/utils/color_helper.dart';
import 'package:wallet/common/common_empty_container.dart';
import 'package:wallet/common/common_text_form_field.dart';

Widget chatroomTextFormField({
  @required TextEditingController controller,
  bool obscureText = false,
  bool readOnly = false,
}) {
  return chatTextFormField(
    controller: controller,
    obscureText: obscureText,
    icon: commonEmptyContainer(),
    hintText: 'Type a message',
    hintColor: ColorHelper.walletGrey.color,
    readOnly: readOnly,
    maxLines: 10,
    minLines: 1,
  );
}
