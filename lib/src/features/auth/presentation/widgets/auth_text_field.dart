import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String labelText;

  const AuthTextField({
    super.key,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        autofocus: true,
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
      ),
    );
  }
}
