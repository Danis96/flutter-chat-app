import 'package:flutter/material.dart';
import 'package:wallet/app/utils/color_helper.dart';

import '../app/utils/color_helper.dart';

Widget commonTextFormField({
  TextEditingController controller,
  bool obscureText = false,
  Widget icon,
  String hintText,
  Color hintColor,
  int maxLines = 1,
  int minLines = 1,
}) {
  return TextFormField(
    controller: controller,
    obscureText: obscureText,
    cursorColor: ColorHelper.chatRed.color,
    validator: (String input) {
      if (input.isEmpty) {
        return 'Field cannot be empty!!!';
      }
      return null;
    },
    style: TextStyle(
      color: ColorHelper.walletWhite.color,
    ),
    maxLines: maxLines,
    minLines: minLines,
    decoration: InputDecoration(
      helperText: '',
      suffixIcon: icon,
      hintText: hintText,
      hintStyle: TextStyle(
        color: hintColor,
        fontWeight: FontWeight.w300,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorHelper.walletGrey.color),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromRGBO(238, 238, 238, 1.0),
        ),
      ),
      errorStyle: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w300,
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromRGBO(236, 98, 128, 1.0),
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromRGBO(236, 98, 128, 1.0),
        ),
      ),
    ),
  );
}

bool _showPassword = true;

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({
    this.obscureText,
    this.controller,
    this.hintColor,
    this.hintText,
    this.icon,
  });

  final TextEditingController controller;
  final bool obscureText;
  final Widget icon;
  final String hintText;
  final Color hintColor;

  @override
  _PasswordTextFormFieldState createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _showPassword,
      cursorColor: ColorHelper.chatRed.color,
      validator: (String input) {
        if (input.isEmpty) {
          return 'Field cannot be empty!!!';
        } else if (input.length < 6) {
          return 'Password must be longer then 6 characters.';
        }
        return null;
      },
      style: TextStyle(
        color: ColorHelper.walletWhite.color,
      ),
      decoration: InputDecoration(
        helperText: '',
        suffixIcon: IconButton(
          color: ColorHelper.walletWhite.color,
          icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
          onPressed: () => setState(() {
            _showPassword = !_showPassword;
          }),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: widget.hintColor,
          fontWeight: FontWeight.w300,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorHelper.walletGrey.color,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(238, 238, 238, 1.0),
          ),
        ),
        errorStyle: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w300,
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(236, 98, 128, 1.0),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(236, 98, 128, 1.0),
          ),
        ),
      ),
    );
  }
}

class PasswordConfirmTextFormField extends StatefulWidget {
  const PasswordConfirmTextFormField({
    this.obscureText,
    this.controller,
    this.hintColor,
    this.hintText,
    this.icon,
  });

  final TextEditingController controller;
  final bool obscureText;
  final Widget icon;
  final String hintText;
  final Color hintColor;

  @override
  _PasswordConfirmTextFormFieldState createState() =>
      _PasswordConfirmTextFormFieldState();
}

class _PasswordConfirmTextFormFieldState
    extends State<PasswordConfirmTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _showPassword,
      cursorColor: ColorHelper.chatRed.color,
      style: TextStyle(
        color: ColorHelper.walletWhite.color,
      ),
      decoration: InputDecoration(
        helperText: '',
        suffixIcon: IconButton(
          color: ColorHelper.walletWhite.color,
          icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
          onPressed: () => setState(() {
            _showPassword = !_showPassword;
          }),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: widget.hintColor,
          fontWeight: FontWeight.w300,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorHelper.walletGrey.color,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(238, 238, 238, 1.0),
          ),
        ),
        errorStyle: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w300,
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(236, 98, 128, 1.0),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(236, 98, 128, 1.0),
          ),
        ),
      ),
    );
  }
}
