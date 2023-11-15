import 'package:dartz/dartz.dart';
import 'package:notez/features/authentication/domain/entities/user.dart';
import 'package:notez/shared/exceptions/auth_exception.dart';

/// Repository for the Authentication feature.
///
/// There is no bespoke signin or signup functions for this repository.
/// This is so because, users are always authenticated with a federated provider.
/// If no user exist with a credential provided, the user is automatically signed up.
/// If the user provides a credential that already exists, then the user is signed in.
/// [authenticateWithGoogle] signs in or signs up users with their Google account.
/// [authenticateWithApple] signs in or signs up users with their Apple account.
/// [signOut] signs a user out of Notez.
/// [authenticateAnonymously] allows users to use Notez without passing any credentials.
/// Anonymous users should be prompted to signup if the decide to use any feature.
/// If they do not authenticate, all data related to their session must be deleted from Notez database.
/// [currentUser] returns the current user of Notez.
abstract class AuthenticationRepository {
  Future<Either<AuthException, User>> authenticateWithGoogle();
  Future<Either<AuthException, User>> authenticateWithApple();
  Future<Either<AuthException, User>> authenticateAnonymously();
  Future<Either<AuthException, void>> signOut();
  Either<AuthException, User?> currentUser();
}
