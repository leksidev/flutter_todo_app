part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final String token;

  AuthSuccess(this.token);
}

final class AuthError extends AuthState {
  final AuthException error;
  AuthError(this.error);
}
