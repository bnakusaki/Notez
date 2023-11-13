import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:notez/features/authentication/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required String uid,
    required String? displayName,
    required String? photoUrl,
  }) : super(
          uid: uid,
          displayName: displayName,
          photoUrl: photoUrl,
        );

  factory UserModel.fromUserCredential(firebase_auth.UserCredential userCredential) {
    final user = userCredential.user!;
    return UserModel(
      uid: user.uid,
      displayName: user.displayName,
      photoUrl: user.photoURL,
    );
  }
  factory UserModel.fromUser(firebase_auth.User user) {
    return UserModel(
      uid: user.uid,
      displayName: user.displayName,
      photoUrl: user.photoURL,
    );
  }
}
