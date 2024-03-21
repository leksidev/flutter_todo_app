import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/src/features/main_panel/presentation/states/add_task_providers.dart';
import 'package:flutter_todo_app/src/features/main_panel/presentation/widgets/deadline_datetime_picker.dart';
import 'package:flutter_todo_app/src/features/main_panel/presentation/widgets/task_text_field.dart';

@RoutePage(name: 'AddTaskScreenRoute')
class AddTask extends ConsumerWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deadlineTime = ref.watch(deadlineTimeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить задачу'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TaskTextField(
                flex: 1,
                labelText: 'Название задачи',
                authofocus: true,
              ),
              deadlineTime != null
                  ? Text(deadlineTime.toString())
                  : Container(),
              const TaskTextField(
                flex: 4,
                maxLength: 1000,
                maxLines: 10,
                labelText: 'Описание задачи',
                authofocus: false,
              ),
              const DeadlineDateTimePicker(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Добавить задачу'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
