import 'package:flutter/material.dart';

import 'package:flutter_todo_app/generated/l10n.dart';
import 'package:flutter_todo_app/src/common_widgets/gap.dart';
import 'package:flutter_todo_app/src/constants/const_sizes.dart';
import 'package:flutter_todo_app/src/features/main_panel/presentation/widgets/task_list.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage(name: 'TasksScreenRoute')
class TasksScreen extends StatelessWidget {
  const TasksScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Column(
        children: [
          const TasksListHeader(),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30.0),
                ),
              ),
              child: Column(
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
                  const TaskList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TasksListHeader extends StatelessWidget {
  const TasksListHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(
        left: kLeftPadding,
        bottom: kBottomPadding,
      ),
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            S.of(context).projects,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Gap(
            size: 20,
          ),
          const Row(
            children: [
              Text('Проекты, в которых вы учавствуете'),
            ],
          ),
        ],
      ),
    );
  }
}
