import 'package:dartz/dartz.dart';
import 'package:notez/features/authentication/domain/entities/user.dart';
import 'package:notez/features/authentication/domain/repository/authentication_repository.dart';
import 'package:notez/shared/exceptions/auth_exception.dart';

class AuthenticateWithApple {
  AuthenticateWithApple(this.authenticationRepository);

  final AuthenticationRepository authenticationRepository;

  Future<Either<AuthException, User>> call() async {
    final response = await authenticationRepository.authenticateWithApple();
    return response;
  }
}
