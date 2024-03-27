import 'package:flutter/material.dart';

import 'package:flutter_todo_app/src/constants/const_sizes.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    super.key,
    required this.headerContainerWidget,
    required this.bodyWidget,
  });

  final Widget headerContainerWidget;
  final Widget bodyWidget;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(
              left: kLeftPadding,
              bottom: kBottomPadding,
            ),
            height: MediaQuery.of(context).size.height * 0.2,
            child: headerContainerWidget,
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30.0),
                ),
              ),
              child: bodyWidget,
            ),
          ),
        ],
      ),
    );
  }
}
