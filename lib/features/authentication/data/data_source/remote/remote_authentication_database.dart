import 'package:firebase_auth/firebase_auth.dart';
import 'package:notez/features/authentication/data/model/user_model.dart';
import 'package:notez/shared/exceptions/auth_exception.dart';

/// Abstract class defining remote data source methods for authentication.
abstract class AuthenticationRemoteDataSource {
  /// Authenticates the user using Google Sign-In.
  Future<UserModel> authenticateWithGoogle();

  /// Authenticates the user using Apple Sign-In.
  Future<UserModel> authenticateWithApple();

  /// Authenticates the user anonymously.
  Future<UserModel> authenticateAnonymously();

  /// Retrieves the currently logged-in user.
  UserModel? getCurrentUser();

  /// Signs the user out.
  Future<void> signOut();
}

/// Implementation of AuthenticationRemoteDataSource interface using Firebase.
class AuthenticationRemoteDataSourceImpl implements AuthenticationRemoteDataSource {
  @override
  Future<UserModel> authenticateWithGoogle() async {
    try {
      GoogleAuthProvider googleProvider = GoogleAuthProvider()
        ..addScope('https://www.googleapis.com/auth/contacts.readonly')
        ..setCustomParameters({'login_hint': 'user@example.com'});

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

      await FirebaseAuth.instance.signInWithPopup(appleProvider);

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithPopup(appleProvider);

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
  UserModel? getCurrentUser() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;
    return UserModel.fromUser(user);
  }
}
