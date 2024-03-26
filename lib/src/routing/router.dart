import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/src/features/main_panel/presentation/main_screen.dart';

import 'package:flutter_todo_app/src/features/auth/presentation/login_screen.dart';
import 'package:flutter_todo_app/src/features/auth/presentation/register_screen.dart';
import 'package:flutter_todo_app/src/features/task/presentation/add_task.dart';
import 'package:flutter_todo_app/src/features/main_panel/presentation/pages/projects_screen.dart';
import 'package:flutter_todo_app/src/features/main_panel/presentation/pages/tasks_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoginScreenRoute.page,
          path: '/',
        ),
        AutoRoute(
          page: RegisterScreenRoute.page,
          path: '/register',
        ),
        AutoRoute(
          page: MainScreenRoute.page,
          path: '/main',
          children: [
            AutoRoute(
              page: ProjectsScreenRoute.page,
              path: 'projects',
            ),
            AutoRoute(
              page: TasksScreenRoute.page,
              path: 'tasks',
            ),
          ],
        ),
        AutoRoute(
          page: AddTaskScreenRoute.page,
          path: '/add_task',
        ),
      ];
}
