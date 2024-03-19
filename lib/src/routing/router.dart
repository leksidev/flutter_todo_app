import 'package:auto_route/auto_route.dart';

import 'package:flutter_todo_app/src/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter_todo_app/src/features/auth/presentation/screens/register_screen.dart';
import 'package:flutter_todo_app/src/features/main_panel/presentation/screens/get_projects_list.dart';
import 'package:flutter_todo_app/src/features/main_panel/presentation/screens/add_task.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginScreenRoute.page, path: '/'),
        AutoRoute(page: RegisterScreenRoute.page, path: '/register'),
        AutoRoute(page: ProjectsListRoute.page, path: '/projects_list'),
        AutoRoute(page: AddTaskRoute.page, path: '/add_task'),
      ];
}
