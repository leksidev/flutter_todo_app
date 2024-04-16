import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/src/constants/const_sizes.dart';
import 'package:flutter_todo_app/src/features/task/domain/task.dart';
import 'package:flutter_todo_app/src/features/task/presentation/task_screen.dart';

class TaskListCard extends StatelessWidget {
  final Task task;

  const TaskListCard({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).pushWidget(
          OneTaskScreen(task: task),
        );
      },
      child: Card(
        elevation: kCardElevation,
        margin: const EdgeInsets.symmetric(
          horizontal: kMarginHorizontal,
          vertical: kMarginVertical,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: kPaddingHorizontal,
            vertical: kPaddingVertical,
          ),
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    task.title,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.comment,
                      size: kIconSize,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
