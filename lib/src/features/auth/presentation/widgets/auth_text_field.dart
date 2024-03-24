import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool autofocus;

  const AuthTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: autofocus,
      obscureText: labelText == 'Пароль' ? true : false,
      enableSuggestions: labelText == 'Пароль' ? false : true,
      autocorrect: labelText == 'Пароль' ? false : true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        suffixIcon: Icon(
            labelText.contains('Пароль') || labelText.contains('пароль')
                ? Icons.remove_red_eye
                : null),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        labelText: labelText,
      ),
    );
  }
}
