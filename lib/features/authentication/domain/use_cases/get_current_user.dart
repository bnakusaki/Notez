import 'package:dartz/dartz.dart';
import 'package:notez/features/authentication/domain/repository/authentication_repository.dart';
import 'package:notez/shared/exceptions/auth_exception.dart';

import '../entities/user.dart';

/// Class representing a use case to get the current logged-in user.
class GetCurrentUser {
  GetCurrentUser(this.authenticationRepository);

  final AuthenticationRepository authenticationRepository;

  Either<AuthException, User?> call() {
    return authenticationRepository.getCurrentUser();
  }
}
