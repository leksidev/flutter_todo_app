import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/src/common_widgets/custom_scaffold.dart';

import 'package:flutter_todo_app/src/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter_todo_app/src/features/auth/presentation/screens/register_screen.dart';
import 'package:flutter_todo_app/src/features/main_panel/presentation/screens/add_task.dart';
import 'package:flutter_todo_app/src/features/main_panel/presentation/screens/get_projects_list.dart';
import 'package:flutter_todo_app/src/features/main_panel/presentation/screens/tasks.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginScreenRoute.page, path: '/login'),
        AutoRoute(page: RegisterScreenRoute.page, path: '/register'),
        AutoRoute(page: CustomScaffoldRoute.page, path: '/', children: [
          AutoRoute(
            page: ProjectsScreenRoute.page,
            path: 'projects',
          ),
          AutoRoute(page: TasksScreenRoute.page, path: 'tasks'),
        ]),
        AutoRoute(page: AddTaskScreenRoute.page, path: '/add_task'),
      ];
}
