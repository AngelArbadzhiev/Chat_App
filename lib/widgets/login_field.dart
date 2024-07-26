import 'package:flutter/material.dart';
import 'package:Chat_App/utils/texfield_styles.dart';

class LoginField extends StatelessWidget {
  final TextEditingController controller;
  final String type;
  final bool obscureTextEnabled;
  const LoginField(
      {super.key,
      required this.controller,
      required this.type,
      required this.obscureTextEnabled});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          if (value != null && value.isNotEmpty && value.length < 5) {
            return "Your $type must be longer than 5 charecters!";
          } else if (value != null && value.isEmpty) {
            return "Please type your $type!";
          }
          return null;
        },
        controller: controller,
        obscureText: obscureTextEnabled,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter your $type.',
          hintStyle: ThemeTextStyle.loginTextFieldStyle,
        ));
  }
}
