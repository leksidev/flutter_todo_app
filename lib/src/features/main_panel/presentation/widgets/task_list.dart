import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/src/features/main_panel/presentation/widgets/task_list_card.dart';
import 'package:flutter_todo_app/src/features/task/domain/task.dart';
import 'package:flutter_todo_app/src/features/task/presentation/bloc/task_bloc.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Task> tasksList = <Task>[];

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
        return Expanded(
          child: ListView.builder(
            itemCount: tasksList.length,
            itemBuilder: (BuildContext context, int index) {
              return TaskListCard(task: tasksList[index]);
            },
          ),
        );
      },
    );
  }
}
