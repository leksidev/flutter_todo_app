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
    LoginScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
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
/// [LoginScreen]
class LoginScreenRoute extends PageRouteInfo<void> {
  const LoginScreenRoute({List<PageRouteInfo>? children})
      : super(
          LoginScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginScreenRoute';

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
