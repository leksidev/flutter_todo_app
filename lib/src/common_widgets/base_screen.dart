import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    super.key,
    required this.headerContainerWidget,
    required this.headerContainerHeight,
    required this.bodyWidget,
  });

  final Widget headerContainerWidget;
  final double headerContainerHeight;
  final Widget bodyWidget;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: headerContainerHeight,
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
