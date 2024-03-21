import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/src/routing/router.dart';
import 'package:flutter_todo_app/src/utils/talker_provider.dart';

@RoutePage(name: 'CustomScaffoldRoute')
class CustomScaffold extends ConsumerWidget {
  final AppBar? appBar;
  const CustomScaffold({
    super.key,
    this.appBar,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final talker = ref.watch(talkerProvider);
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
  }
}
