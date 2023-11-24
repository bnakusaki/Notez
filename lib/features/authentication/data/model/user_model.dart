import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:notez/features/authentication/domain/entities/user.dart';

/// UserModel class represents a concrete implementation of the User entity.
/// Extends the User entity to utilize its properties.
class UserModel extends User {
  const UserModel({
    required super.uid,
    required super.displayName,
    required super.photoUrl,
  });

  /// Factory method to create a UserModel instance from a Firebase User.
  factory UserModel.fromUser(firebase_auth.User user) {
    return UserModel(
      uid: user.uid,
      displayName: user.displayName,
      photoUrl: user.photoURL,
    );
  }
}
