/// A User entity with properties: uid, displayName, and photoUrl.
class User {
  /// The unique identifier for the user.
  final String uid;

  /// The display name of the user.
  final String? displayName;

  /// The URL of the user's photo.
  final String? photoUrl;

  /// Constructor for creating a User instance.
  /// [uid] is the unique identifier for the user (required).
  /// [displayName] is the display name of the user (nullable).
  /// [photoUrl] is the URL of the user's photo (nullable).
  const User({
    required this.uid,
    required this.displayName,
    required this.photoUrl,
  });
}
