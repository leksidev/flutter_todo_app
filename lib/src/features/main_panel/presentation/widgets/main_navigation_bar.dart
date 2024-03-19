import 'package:flutter/material.dart';

class MainNavigationBar extends StatelessWidget {
  const MainNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Проекты',
        ),
        NavigationDestination(
          icon: Icon(Icons.person),
          label: 'Задачи',
        ),
        NavigationDestination(
          icon: Icon(Icons.settings),
          label: 'Настройки',
        ),
      ],
    );
  }
}
