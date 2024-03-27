import 'package:flutter/material.dart';

class HorisontalTabMenu extends StatelessWidget {
  const HorisontalTabMenu({
    super.key,
    required this.tabs,
  });

  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          tabs.length,
          (index) => TextButton(
            onPressed: null,
            child: Text(
              tabs[index],
            ),
          ),
        ),
      ],
    );
  }
}
