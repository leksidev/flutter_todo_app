// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddTaskScreenRoute.name: (routeData) {
      final args = routeData.argsAs<AddTaskScreenRouteArgs>(
          orElse: () => const AddTaskScreenRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddTask(key: args.key),
      );
    },
    LoginScreenRoute.name: (routeData) {
      final args = routeData.argsAs<LoginScreenRouteArgs>(
          orElse: () => const LoginScreenRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginScreen(key: args.key),
      );
    },
    MainScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MainScreenRouteArgs>(
          orElse: () => const MainScreenRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MainScreen(
          key: args.key,
          appBar: args.appBar,
        ),
      );
    },
    MainTasksScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainTasksScreen(),
      );
    },
    ProjectsScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProjectsScreen(),
      );
    },
    RegisterScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterScreen(),
      );
    },
  };
}

/// generated route for
/// [AddTask]
class AddTaskScreenRoute extends PageRouteInfo<AddTaskScreenRouteArgs> {
  AddTaskScreenRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AddTaskScreenRoute.name,
          args: AddTaskScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddTaskScreenRoute';

  static const PageInfo<AddTaskScreenRouteArgs> page =
      PageInfo<AddTaskScreenRouteArgs>(name);
}

class AddTaskScreenRouteArgs {
  const AddTaskScreenRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AddTaskScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [LoginScreen]
class LoginScreenRoute extends PageRouteInfo<LoginScreenRouteArgs> {
  LoginScreenRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LoginScreenRoute.name,
          args: LoginScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginScreenRoute';

  static const PageInfo<LoginScreenRouteArgs> page =
      PageInfo<LoginScreenRouteArgs>(name);
}

class LoginScreenRouteArgs {
  const LoginScreenRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [MainScreen]
class MainScreenRoute extends PageRouteInfo<MainScreenRouteArgs> {
  MainScreenRoute({
    Key? key,
    AppBar? appBar,
    List<PageRouteInfo>? children,
  }) : super(
          MainScreenRoute.name,
          args: MainScreenRouteArgs(
            key: key,
            appBar: appBar,
          ),
          initialChildren: children,
        );

  static const String name = 'MainScreenRoute';

  static const PageInfo<MainScreenRouteArgs> page =
      PageInfo<MainScreenRouteArgs>(name);
}

class MainScreenRouteArgs {
  const MainScreenRouteArgs({
    this.key,
    this.appBar,
  });

  final Key? key;

  final AppBar? appBar;

  @override
  String toString() {
    return 'MainScreenRouteArgs{key: $key, appBar: $appBar}';
  }
}

/// generated route for
/// [MainTasksScreen]
class MainTasksScreenRoute extends PageRouteInfo<void> {
  const MainTasksScreenRoute({List<PageRouteInfo>? children})
      : super(
          MainTasksScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainTasksScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProjectsScreen]
class ProjectsScreenRoute extends PageRouteInfo<void> {
  const ProjectsScreenRoute({List<PageRouteInfo>? children})
      : super(
          ProjectsScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProjectsScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterScreen]
class RegisterScreenRoute extends PageRouteInfo<void> {
  const RegisterScreenRoute({List<PageRouteInfo>? children})
      : super(
          RegisterScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
