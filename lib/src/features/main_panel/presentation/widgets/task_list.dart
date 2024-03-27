import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/generated/l10n.dart';
import 'package:flutter_todo_app/src/constants/const_sizes.dart';
import 'package:flutter_todo_app/src/features/main_panel/presentation/widgets/task_list_card.dart';
import 'package:flutter_todo_app/src/features/task/domain/task.dart';
import 'package:flutter_todo_app/src/features/task/presentation/bloc/task_bloc.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Task> tasksList = <Task>[
      Task(
        id: 1,
        title: 'Задача 1',
        description: 'Описание задачи 1',
        deadlineDate: DateTime.now(),
      ),
      Task(
        id: 2,
        title: 'Задача 2',
      ),
    ];

    return BlocConsumer<TaskBloc, TaskState>(
      listener: (context, state) {
        if (state is TaskDeleted) {
          tasksList.remove(state.task);
        }
      },
      builder: (context, state) {
        if (state is TaskSuccess) {
          tasksList.add(state.task);
        }
        return Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kLeftPadding, vertical: kTopPadding),
              child: Text(
                S.of(context).tasks,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasksList.length,
                itemBuilder: (BuildContext context, int index) {
                  return TaskListCard(task: tasksList[index]);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
