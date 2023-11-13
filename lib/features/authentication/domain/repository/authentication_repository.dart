import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:notez/features/authentication/domain/entities/user.dart';
import 'package:notez/shared/exceptions/auth_exception.dart';

abstract class AuthenticationRepository {
  Future<Either<AuthException, User>> authenticateWithGoogle();
  Future<Either<AuthException, User>> authenticateWithApple();
  Future<Either<AuthException, User>> authenticateAnonymously();
  Future<Either<AuthException, void>> signOut();
  Either<AuthException, User?> currentUser();

  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [null] if the user is not authenticated.
  Stream<firebase_auth.User?> user();
}
