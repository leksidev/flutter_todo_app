import 'package:flutter/material.dart';

class MainTitleTextWidget extends StatelessWidget {
  const MainTitleTextWidget({
    super.key,
    required this.screenTitle,
  });

  final String screenTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      screenTitle,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
