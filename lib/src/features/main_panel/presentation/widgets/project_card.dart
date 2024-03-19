import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final int openTasksCount;
  final int newTasksCount;

  const ProjectCard({
    super.key,
    required this.color,
    required this.child,
    required this.openTasksCount,
    required this.newTasksCount,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 0.5,
          color: color,
          child: SizedBox(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
              child: Align(alignment: Alignment.topLeft, child: child),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Opacity(
            opacity: 0.5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Открытых задач: $openTasksCount'),
                  Text('Новых задач: $newTasksCount'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
