import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/generated/l10n.dart';
import 'package:flutter_todo_app/src/common_widgets/gap.dart';
import 'package:flutter_todo_app/src/features/task/domain/task.dart';
import 'package:flutter_todo_app/src/features/task/presentation/bloc/task_bloc.dart';
import 'package:flutter_todo_app/src/routing/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

@RoutePage(name: 'TasksScreenRoute')
class TasksScreen extends StatelessWidget {
  const TasksScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Task> tasksList = [];
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
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Text(
                S.of(context).tasks,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const Gap(
              size: 20,
            ),
            FilledButton(
              onPressed: () => AutoRouter.of(context).push(
                AddTaskScreenRoute(),
              ),
              child: Text(S.of(context).add_task),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasksList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Slidable(
                    startActionPane: ActionPane(
                      motion: const BehindMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {},
                          backgroundColor: const Color(0xFF7BC043),
                          foregroundColor: Colors.white,
                          icon: Icons.done,
                          label: 'Done',
                        ),
                      ],
                    ),
                    endActionPane: ActionPane(
                      motion: const StretchMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            context.read<TaskBloc>().add(
                                  DeleteTask(task: tasksList[index]),
                                );
                          },
                          backgroundColor: const Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    closeOnScroll: true,
                    child: ListTile(
                      title: Text(tasksList[index].title),
                      style: ListTileStyle.list,
                    ),
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
