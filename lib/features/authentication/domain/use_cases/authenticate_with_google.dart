import 'package:dartz/dartz.dart';
import 'package:notez/features/authentication/domain/entities/user.dart';
import 'package:notez/features/authentication/domain/repository/authentication_repository.dart';
import 'package:notez/shared/exceptions/auth_exception.dart';

class AuthenticateWithGoogle {
  AuthenticateWithGoogle(this._authenticationRepository);

  final AuthenticationRepository _authenticationRepository;

  Future<Either<AuthException, User>> call() async =>
      await _authenticationRepository.authenticateWithGoogle();
}
