import 'package:equatable/equatable.dart';

/// User entity.
class User extends Equatable {
  const User({
    required this.uid,
    required this.displayName,
    required this.photoUrl,
  });

  /// The current user's id.
  final String uid;

  /// The current user's name.
  final String? displayName;

  /// The current user's photo.
  final String? photoUrl;

  @override
  List<Object?> get props => [uid, displayName, photoUrl];
}
