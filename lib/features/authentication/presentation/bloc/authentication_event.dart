part of 'authentication_bloc.dart';

/// Base class for authentication events.
abstract class AuthenticationEvent {}

/// Event to authenticate with Google.
class AuthenticateWithGoogleEvent extends AuthenticationEvent {}

/// Event to authenticate with Apple.
class AuthenticateWithAppleEvent extends AuthenticationEvent {}

/// Event to authenticate anonymously.
class AuthenticateAnonymouslyEvent extends AuthenticationEvent {}

/// Event to log a user out.
class LogOutEvent extends AuthenticationEvent {}

/// Event to get the user currently logged-in.
class GetCurrentUserEvent extends AuthenticationEvent {}
