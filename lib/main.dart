import 'dart:convert';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_todo_app/src/features/task/presentation/bloc/task_bloc.dart';
import 'generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_todo_app/src/routing/router.dart';
import 'package:flutter_todo_app/src/utils/bloc_observer.dart';
import 'package:flutter_todo_app/src/utils/talker_provider.dart';
import 'package:json_theme/json_theme.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeStr = await rootBundle.loadString('assets/base_theme.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;
  WidgetsFlutterBinding.ensureInitialized();
  final darkThemeStr =
      await rootBundle.loadString('assets/base_dark_theme.json');
  final darkThemeJson = jsonDecode(darkThemeStr);
  final darkTheme = ThemeDecoder.decodeThemeData(darkThemeJson)!;

  runApp(
    ProviderScope(
      child: MainApp(
        theme: theme,
        darkTheme: darkTheme,
      ),
    ),
  );
}

class MainApp extends ConsumerWidget {
  final ThemeData theme;
  final ThemeData darkTheme;

  MainApp({super.key, required this.theme, required this.darkTheme});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Bloc.observer = AppBlocObserver(
      talker: ref.watch(talkerProvider),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
        BlocProvider<TaskBloc>(
          create: (context) => TaskBloc(),
        ),
      ],
      child: MaterialApp.router(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: true,
        routerConfig: _appRouter.config(
          navigatorObservers: () => [
            TalkerRouteObserver(
              ref.watch(talkerProvider),
            ),
          ],
        ),
        title: 'Flutter Todo App',
        theme: theme,
        darkTheme: darkTheme,
      ),
    );
  }
}
