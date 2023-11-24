import 'package:dartz/dartz.dart';
import 'package:notez/features/authentication/domain/entities/user.dart';
import 'package:notez/shared/exceptions/auth_exception.dart';

/// Represents an Authentication Repository.
///
/// There is no bespoke signin or signup functions for this repository.
/// This is so because, users are always authenticated with a federated provider.
/// If no user exist with a credential provided, the user is automatically signed up.
/// If the user provides a credential that already exists, then the user is signed in.
/// [authenticateWithGoogle] signs in or signs up users with their Google account.
/// [authenticateWithApple] signs in or signs up users with their Apple account.
/// [logOut] signs a user out of Notez.
/// [authenticateAnonymously] allows users to use Notez without passing any credentials.
/// Anonymous users should be prompted to signup if the decide to use any feature.
/// If they do not authenticate, all data related to their session must be deleted from Notez database.
/// [getCurrentUser] returns the current user of Notez.
abstract class AuthenticationRepository {
  /// Authenticates the user with Google Sign-In.
  Future<Either<AuthException, User>> authenticateWithGoogle();

  /// Authenticates the user with Apple Sign-In.
  Future<Either<AuthException, User>> authenticateWithApple();

  /// Authenticates the user anonymously.
  Future<Either<AuthException, User>> authenticateAnonymously();

  /// Logs the current user out.
  Future<Either<AuthException, void>> logOut();

  /// Retrieves the current logged-in user.
  Either<AuthException, User?> getCurrentUser();
}
