import 'package:flutter/material.dart';

import 'package:flutter_todo_app/generated/l10n.dart';
import 'package:flutter_todo_app/src/common_widgets/base_screen.dart';
import 'package:flutter_todo_app/src/features/main_panel/presentation/widgets/task_list.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_todo_app/src/features/main_panel/presentation/widgets/tasks_list_header.dart';

@RoutePage(name: 'TasksScreenRoute')
class TasksScreen extends StatelessWidget {
  const TasksScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      headerContainerWidget: TasksListHeaderWidget(
        screenTitle: S.of(context).tasks,
      ),
      bodyWidget: const TaskList(),
    );
  }
}
