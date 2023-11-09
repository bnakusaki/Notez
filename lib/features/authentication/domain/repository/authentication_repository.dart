import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<Either<Exception, UserCredential>> authenticateWithGoogle();
  Future<Either<Exception, UserCredential>> authenticateWithApple();
  Future<Either<Exception, UserCredential>> authenticateAnonymously();
  Future<void> signOut();
  User? getCurrentUser();
}
