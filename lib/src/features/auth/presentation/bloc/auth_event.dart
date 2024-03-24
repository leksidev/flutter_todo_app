part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthDataRequested extends AuthEvent {
  final String login;
  final String password;

  AuthDataRequested({
    required this.login,
    required this.password,
  });
}

class AuthLogoutRequested extends AuthEvent {}
