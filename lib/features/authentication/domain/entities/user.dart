import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import 'federated_provider.dart';

/// User entity.
class User extends Equatable {
  const User({
    required this.uid,
    required this.displayName,
    required this.photoUrl,
  });

  /// Id of a user.
  ///
  /// Fetched from firebase. ie [firebase_auth.User.uid].
  final String uid;

  /// Username of a user.
  ///
  /// As provided by the [FederatedProvider].
  final String? displayName;

  /// Link to the profile picture of a user.
  ///
  /// As provided by the [FederatedProvider].
  final String? photoUrl;

  @override
  List<Object?> get props => [uid, displayName, photoUrl];
}
