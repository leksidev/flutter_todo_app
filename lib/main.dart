import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/src/routing/router.dart';

void main() {
  runApp(
    ProviderScope(child: MainApp()),
  );
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
      ),
    );
  }
}
