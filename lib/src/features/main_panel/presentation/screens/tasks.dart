import 'package:flutter/material.dart';
import 'package:flutter_todo_app/src/routing/router.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage(name: 'TasksScreenRoute')
class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        const Text('Задачи'),
        ElevatedButton(
          onPressed: () =>
              AutoRouter.of(context).push(const AddTaskScreenRoute()),
          child: const Text('Добавить задачу'),
        ),
      ]),
    );
  }
}
