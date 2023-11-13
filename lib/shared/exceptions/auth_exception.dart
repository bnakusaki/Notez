// ignore_for_file: public_member_api_docs, sort_constructors_first
class AuthException implements Exception {
  AuthException(
    this.message,
    this.details,
  );
  final String message;
  final String details;
}

/// Thrown when a failure occurs during authentication with Google.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithCredential.html.
class AuthenticateWithFederatedProviderFailure implements AuthException {
  const AuthenticateWithFederatedProviderFailure([
    this.message = 'An unknown exception occured',
    this.details =
        'Hi dear, something wrong happened.\nNot your fault, certainly ours. We will fix this soon.',
  ]);

  @override
  final String message;
  @override
  final String details;

  /// Create and authentication failure message from Firebase's authentication
  /// exception code.
  factory AuthenticateWithFederatedProviderFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const AuthenticateWithFederatedProviderFailure(
            'This account exists with different credential.',
            'You are seesing this because there iss already an account associated with the email address you provided.');
      case 'invalid-credential':
        return const AuthenticateWithFederatedProviderFailure(
          'Invalid credential.',
          'You are seeing this because the credential you provided is either malformed or has expired.',
        );
      case 'operation-not-allowed':
        return const AuthenticateWithFederatedProviderFailure(
          'Operation not allowed',
          'You are seeing this because the of account linked to the credential you provided is not currently enabled.',
        );
      case 'user-disabled':
        return const AuthenticateWithFederatedProviderFailure(
          'User disabled',
          'You are seeing this because the user linked to the provided credential has been disabled.',
        );
      case 'user-not-found':
        return const AuthenticateWithFederatedProviderFailure(
          'User not found',
          'You are seeing this because you are trying to sign in with a credential from an account that has no user associated with it.',
        );
      case 'wrong-password':
        return const AuthenticateWithFederatedProviderFailure(
          'Wrong password',
          'You are seeing this because the provided password is either incorrect for the associated email or the account linked to the email does not have a password set.',
        );
      case 'invalid-verification-code':
        return const AuthenticateWithFederatedProviderFailure(
          'Invalid verification code',
          'You are seeing this because the verification code provided in the credential is not valid.',
        );
      case 'invalid-verification-id':
        return const AuthenticateWithFederatedProviderFailure(
          'Invalid verification id',
          'You are seeing this because the verification ID provided in the credential is not valid.',
        );
      default:
        return const AuthenticateWithFederatedProviderFailure();
    }
  }
}
