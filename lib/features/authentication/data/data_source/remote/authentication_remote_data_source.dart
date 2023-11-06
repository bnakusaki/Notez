import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:notez/shared/exceptions.dart';

abstract class AuthenticationRemoteDataSource {
  Future<Either<Exception, UserCredential>> authenticateWithGoogle();
  Future<Either<Exception, UserCredential>> authenticateWithApple();
  Future<Either<Exception, UserCredential>> authenticateAnonymously();
}

class AuthenticationRemoteDataSourceImpl implements AuthenticationRemoteDataSource {
  @override
  Future<Either<Exception, UserCredential>> authenticateWithGoogle() async {
    try {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
      googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

      GoogleAuthProvider googleProvider0 = GoogleAuthProvider();

      googleProvider0.addScope('https://www.googleapis.com/auth/contacts.readonly');
      googleProvider0.setCustomParameters({'login_hint': 'user@example.com'});

      final response = await FirebaseAuth.instance.signInWithPopup(googleProvider0);
      return Right(response);
    } catch (e) {
      return Left(AuthException("$e"));
    }
  }

  @override
  Future<Either<Exception, UserCredential>> authenticateWithApple() async {
    try {
      final appleProvider = AppleAuthProvider();
      if (kIsWeb) {
        await FirebaseAuth.instance.signInWithPopup(appleProvider);
      } else {
        await FirebaseAuth.instance.signInWithProvider(appleProvider);
      }
      final appleProvider0 = AppleAuthProvider();

      UserCredential userCredential = await FirebaseAuth.instance.signInWithPopup(appleProvider0);
      // Keep the authorization code returned from Apple platforms
      String? authCode = userCredential.additionalUserInfo?.authorizationCode;
      // Revoke Apple auth token
      await FirebaseAuth.instance.revokeTokenWithAuthorizationCode(authCode!);
      return Right(userCredential);
    } catch (e) {
      return Left(AuthException("$e"));
    }
  }

  @override
  Future<Either<Exception, UserCredential>> authenticateAnonymously() async {
    try {
      final response = await FirebaseAuth.instance.signInAnonymously();
      return Right(response);
    } catch (e) {
      return Left(AuthException("$e"));
    }
  }
}
