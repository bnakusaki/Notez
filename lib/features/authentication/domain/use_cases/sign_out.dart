import 'package:dartz/dartz.dart';
import 'package:notez/features/authentication/domain/repository/authentication_repository.dart';
import 'package:notez/shared/exceptions/auth_exception.dart';

class SignOut {
  SignOut(this.authenticationRepository);

  final AuthenticationRepository authenticationRepository;

  Future<Either<AuthException, void>> call() async {
    final response = await authenticationRepository.signOut();
    return response;
  }
}
