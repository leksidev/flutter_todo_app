import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_todo_app/src/routing/router.dart';

@RoutePage(name: 'MainScreenRoute')
class MainScreen extends ConsumerWidget {
  final AppBar? appBar;
  const MainScreen({
    super.key,
    this.appBar,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitial) {
          return Scaffold(
            body: Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const Text('Вы не авторизованы'),
                ElevatedButton(
                  onPressed: () {
                    AutoRouter.of(context).pushNamed('/');
                  },
                  child: const Text('Войти'),
                ),
              ]),
            ),
          );
        }
        return SafeArea(
          child: AutoTabsScaffold(
            routes: const [
              ProjectsScreenRoute(),
              TasksScreenRoute(),
            ],
            bottomNavigationBuilder: (_, tabsRouter) {
              return NavigationBar(
                selectedIndex: tabsRouter.activeIndex,
                onDestinationSelected: tabsRouter.setActiveIndex,
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Icons.home),
                    label: 'Проекты',
                    enabled: true,
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.task),
                    label: 'Задачи',
                    enabled: true,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
