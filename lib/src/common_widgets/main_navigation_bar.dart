import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Map<String, NavigationDestination> navbarRoutes = {
  '/projects_list': const NavigationDestination(
    icon: Icon(Icons.home),
    label: 'Проекты',
  ),
  '/add_task': const NavigationDestination(
    icon: Icon(Icons.person),
    label: 'Задачи',
  ),
  '/settings': const NavigationDestination(
    icon: Icon(Icons.settings),
    label: 'Настройки',
  ),
};

final StateProvider<int> currentIndexProvider = StateProvider((ref) => 0);

class MainNavigationBar extends ConsumerWidget {
  const MainNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    return NavigationBar(
      selectedIndex: currentIndex,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      onDestinationSelected: (int index) {
        ref.watch(currentIndexProvider.notifier).state = index;
        AutoRouter.of(context).pushNamed(navbarRoutes.keys.toList()[index]);
      },
      destinations: [
        ...navbarRoutes.values,
      ],
    );
  }
}
