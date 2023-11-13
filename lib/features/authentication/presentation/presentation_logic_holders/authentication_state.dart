import 'package:equatable/equatable.dart';
import 'package:notez/features/authentication/domain/entities/user.dart';

enum AuthenticationStatus {
  authenticated,
  processing,
  failedToAuthenticate,
  unauthenticated,
}

final class AuthenticationState extends Equatable {
  const AuthenticationState._({
    required this.status,
    required this.user,
    this.message,
    this.details,
  });

  final AuthenticationStatus status;
  final User? user;
  final String? message;
  final String? details;

  const AuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationState.failedToAuthenticate({String? failureMessage, String? failureDetails})
      : this._(
          status: AuthenticationStatus.failedToAuthenticate,
          user: null,
          message: failureMessage,
          details: failureDetails,
        );

  const AuthenticationState.unAuthenticated()
      : this._(status: AuthenticationStatus.unauthenticated, user: null);

  const AuthenticationState.processing()
      : this._(status: AuthenticationStatus.processing, user: null);

  @override
  List<Object?> get props => [];
}
