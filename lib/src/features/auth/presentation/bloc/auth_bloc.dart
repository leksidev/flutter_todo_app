import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/src/exceptions/auth_exceptions.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthDataRequested>(_onAuthDataRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
  }

  void _onAuthDataRequested(
      AuthDataRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final login = event.login;
      final password = event.password;
      if (login.isEmpty || password.isEmpty) {
        return emit(
          AuthError(
            AuthDataCanNotBeEmptyException(),
          ),
        );
      }
      if (password.length < 6) {
        return emit(
          AuthError(ShortPasswordException()),
        );
      }
      await Future.delayed(
        const Duration(seconds: 1),
        () {
          return emit(
            AuthSuccess('$password-$login'),
          );
        },
      );
    } catch (e) {
      emit(
        AuthError(
          AuthExceptionMapper.map(e),
        ),
      );
    }
  }

  void _onAuthLogoutRequested(
      AuthLogoutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await Future.delayed(
        const Duration(seconds: 1),
        () {
          return emit(AuthInitial());
        },
      );
    } catch (e) {
      emit(
        AuthError(
          AuthExceptionMapper.map(e),
        ),
      );
    }
  }
}
