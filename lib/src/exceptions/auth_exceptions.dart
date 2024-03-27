import 'package:flutter_todo_app/generated/l10n.dart';

class AuthException implements Exception {
  AuthException(this.message);
  final String message;
}

class AuthDataCanNotBeEmptyException extends AuthException {
  AuthDataCanNotBeEmptyException()
      : super(S.current.loginAndPasswordCanNotBeEmpty);
}

class UncorrectLoginException extends AuthException {
  UncorrectLoginException() : super(S.current.uncorrectLogin);
}

class UncorrectPasswordException extends AuthException {
  UncorrectPasswordException() : super(S.current.uncorrectPassword);
}

class ShortPasswordException extends AuthException {
  ShortPasswordException() : super(S.current.tooShortPassword);
}

class AuthDataNotFoundException extends AuthException {
  AuthDataNotFoundException() : super(S.current.authenticationDataNotFound);
}

class AuthExceptionMapper {
  static AuthException map(dynamic e) {
    if (e is AuthException) {
      return e;
    } else if (e is UncorrectLoginException) {
      return UncorrectLoginException();
    } else if (e is UncorrectPasswordException) {
      return UncorrectPasswordException();
    } else if (e is ShortPasswordException) {
      return ShortPasswordException();
    } else if (e is AuthDataNotFoundException) {
      return AuthDataNotFoundException();
    } else {
      return AuthException(S.current.unknownAuthenticationException);
    }
  }
}
