import 'package:dartz/dartz.dart';
import 'package:notez/features/authentication/domain/entities/user.dart';
import 'package:notez/features/authentication/domain/repository/authentication_repository.dart';
import 'package:notez/shared/exceptions/auth_exception.dart';

class CurrentUser {
  CurrentUser(this.authenticationRepository);

  final AuthenticationRepository authenticationRepository;

  Either<AuthException, User?> call() {
    final response = authenticationRepository.currentUser();
    return response;
  }
}
