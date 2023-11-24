import 'package:notez/features/authentication/domain/entities/user.dart';

/// Abstract class representing various states of authentication.
abstract class AuthenticationState {}

/// Represents the state when the user is not authenticated.
class Unauthenticated extends AuthenticationState {}

/// Represents the state when the user is authenticated.
class Authenticated extends AuthenticationState {
  final User user;

  Authenticated(this.user);
}

/// Represents the state when authentication fails.
class FailedToAuthenticate extends AuthenticationState {
  final String message;
  final String? detail;

  FailedToAuthenticate(this.message, this.detail);
}

/// Represents the state when authentication process is ongoing.
class Authenticating extends AuthenticationState {}
