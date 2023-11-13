import 'package:dartz/dartz.dart';
import 'package:notez/features/authentication/domain/repository/authentication_repository.dart';
import 'package:notez/shared/exceptions/auth_exception.dart';

class SignOut {
  SignOut(this._authenticationRepository);

  final AuthenticationRepository _authenticationRepository;

  Future<Either<AuthException, void>> call() async => await _authenticationRepository.signOut();
}
