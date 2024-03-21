import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/src/routing/router.dart';
import 'package:flutter_todo_app/src/utils/talker_provider.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() {
  runApp(
    ProviderScope(child: MainApp()),
  );
}

class MainApp extends ConsumerWidget {
  MainApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: true,
      routerConfig: _appRouter.config(
        navigatorObservers: () => [
          TalkerRouteObserver(
            ref.watch(talkerProvider),
          ),
        ],
      ),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
      ),
    );
  }
}
