import 'package:flutter/material.dart';

class ColoredButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget label;

  const ColoredButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: const Size.fromWidth(180).width,
        height: const Size.fromHeight(50).height,
        child: FilledButton(
          onPressed: onPressed,
          child: label,
        ),
      ),
    );
  }
}
