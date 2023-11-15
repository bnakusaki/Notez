import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:notez/features/authentication/data/model/user_model.dart';
import 'package:notez/shared/exceptions/auth_exception.dart';

abstract class AuthenticationRemoteDataSource {
  Future<UserModel> authenticateWithGoogle();
  Future<UserModel> authenticateWithApple();
  Future<UserModel> authenticateAnonymously();
  Future<void> signOut();
  UserModel? currentUser();
}

class AuthenticationRemoteDataSourceImpl implements AuthenticationRemoteDataSource {
  @override
  Future<UserModel> authenticateWithGoogle() async {
    try {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
      googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithPopup(googleProvider);

      final UserModel user = UserModel.fromUser(userCredential.user!);

      return user;
    } on FirebaseAuthException catch (e) {
      throw AuthenticateWithFederatedProviderFailure(e.message!);
    }
  }

  @override
  Future<UserModel> authenticateWithApple() async {
    try {
      final appleProvider = AppleAuthProvider();
      if (kIsWeb) {
        await FirebaseAuth.instance.signInWithPopup(appleProvider);
      } else {
        await FirebaseAuth.instance.signInWithProvider(appleProvider);
      }
      final appleProvider0 = AppleAuthProvider();

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithPopup(appleProvider0);

      final UserModel user = UserModel.fromUser(userCredential.user!);
      return user;
    } on FirebaseAuthException catch (e) {
      throw AuthenticateWithFederatedProviderFailure(e.message!);
    }
  }

  @override
  Future<UserModel> authenticateAnonymously() async {
    final UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
    final UserModel user = UserModel.fromUser(userCredential.user!);
    return user;
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  UserModel? currentUser() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;
    return UserModel.fromUser(user);
  }
}
