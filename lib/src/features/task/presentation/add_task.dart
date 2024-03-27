import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/generated/l10n.dart';
import 'package:flutter_todo_app/src/common_widgets/base_screen.dart';
import 'package:flutter_todo_app/src/common_widgets/main_title_text.dart';
import 'package:flutter_todo_app/src/constants/const_sizes.dart';
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
        return Hero(
          tag: 'add_task',
          child: Scaffold(
            body: BaseScreen(
              headerContainerWidget: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: MainTitleTextWidget(
                  screenTitle: S.of(context).add_task,
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.save),
                    onPressed: () {
                      context.read<TaskBloc>().add(
                            CreateNewTask(
                              task: Task(
                                id: titleController.text.trim().length,
                                title: titleController.text.trim(),
                                description: descriptionController.text.trim(),
                                deadlineDate: DateTime.now(),
                              ),
                            ),
                          );
                    },
                  ),
                ],
              ),
              bodyWidget: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: kTopPadding,
                    left: kLeftPadding,
                    right: kRightPadding,
                    bottom: kBottomPadding,
                  ),
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
