import 'package:flutter/material.dart';

class TaskTextField extends StatelessWidget {
  final int flex;
  final TextEditingController controller;
  final int maxLength;
  final int maxLines;
  final String labelText;
  final bool authofocus;

  const TaskTextField({
    super.key,
    required this.flex,
    required this.controller,
    this.maxLength = 100,
    this.maxLines = 1,
    required this.labelText,
    required this.authofocus,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 1,
          child: TextField(
            autofocus: true,
            controller: controller,
            maxLength: maxLength,
            maxLines: maxLines,
            decoration: InputDecoration(
              filled: true,
              labelText: labelText,
              floatingLabelStyle: TextStyle(
                color: Theme.of(context).shadowColor,
              ),
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        )
      ],
    );
  }
}
