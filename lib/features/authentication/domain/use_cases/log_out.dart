import 'package:dartz/dartz.dart';
import 'package:notez/features/authentication/domain/repository/authentication_repository.dart';
import 'package:notez/shared/exceptions/auth_exception.dart';

/// Class representing a use case to perform user logout.
class LogOut {
  LogOut(this.authenticationRepository);

  final AuthenticationRepository authenticationRepository;

  Future<Either<AuthException, void>> call() async {
    return await authenticationRepository.logOut();
  }
}
