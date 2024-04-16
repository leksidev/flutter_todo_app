import 'package:flutter/material.dart';

import 'package:flutter_todo_app/generated/l10n.dart';
import 'package:flutter_todo_app/src/common_widgets/base_screen.dart';
import 'package:flutter_todo_app/src/features/main_panel/presentation/widgets/projects_list.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage(name: 'ProjectsScreenRoute')
class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      headerContainerHeight: MediaQuery.of(context).size.height * 0.1,
      headerContainerWidget: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: Text(S.of(context).projects,
            style: Theme.of(context).textTheme.titleLarge),
      ),
      bodyWidget: const ProjectsList(),
    );
  }
}
