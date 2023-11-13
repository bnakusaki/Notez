import 'package:notez/features/authentication/domain/entities/user.dart';

sealed class AuthenticationEvent {
  const AuthenticationEvent();
}

final class LogOutRequested extends AuthenticationEvent {
  const LogOutRequested();
}

final class _AppUserChanged extends AuthenticationEvent {
  _AppUserChanged(this.user);

  final User? user;
}
