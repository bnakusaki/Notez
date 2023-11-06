import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notez/features/authentication/domain/repository/authentication_repository.dart';

class AuthenticateWithApple {
  AuthenticateWithApple(this._authenticationRepository);

  final AuthenticationRepository _authenticationRepository;

  Future<Either<Exception, UserCredential>> call() async =>
      await _authenticationRepository.authenticateWithApple();
}
