import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/generated/l10n.dart';
import 'package:flutter_todo_app/src/features/task/presentation/widgets/calendar_line.dart';
import 'package:flutter_todo_app/src/features/main_panel/presentation/widgets/task_text_field.dart';
import 'package:flutter_todo_app/src/features/task/domain/task.dart';
import 'package:flutter_todo_app/src/features/task/presentation/bloc/task_bloc.dart';

@RoutePage(name: 'AddTaskScreenRoute')
class AddTask extends StatelessWidget {
  AddTask({super.key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final DateTime? createdDate = DateTime.now();
  final DateTime? deadlineDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(
      listener: (context, state) {
        if (state is TaskError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
        if (state is TaskSuccess) {
          context.router.maybePop();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).add_task),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TaskTextField(
                    flex: 1,
                    controller: titleController,
                    labelText: S.of(context).title,
                    authofocus: true,
                  ),
                  const CalendarLine(title: 'Задачи'),
                  TaskTextField(
                    flex: 4,
                    controller: descriptionController,
                    maxLength: 1000,
                    maxLines: 10,
                    labelText: S.of(context).description,
                    authofocus: false,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FilledButton(
                        onPressed: () {
                          context.read<TaskBloc>().add(
                                CreateNewTask(
                                  task: Task(
                                    id: titleController.text.trim().length,
                                    title: titleController.text.trim(),
                                    description:
                                        descriptionController.text.trim(),
                                    createdDate: DateTime.now(),
                                    deadlineDate: DateTime.now(),
                                  ),
                                ),
                              );
                        },
                        child: Text(S.of(context).add_task),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
